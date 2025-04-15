return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
      { "<leader>t",  "<cmd>TodoFloatProject<cr>", desc = "Floating Project TODOs" },
      { "<leader>ft", "<cmd>TodoFloatFile<cr>",    desc = "Floating File TODOs"    },
      { "<leader>ta", "<cmd>TodoEditProject<cr>",  desc = "Edit TODO.md in Float"   },
    },
    opts = {
      -- your existing todo-comments settings (or leave empty for defaults)
    },
    config = function(_, opts)
      local tc     = require("todo-comments")
      local search = require("todo-comments.search")
  
      tc.setup(opts)
  
      -- Helper to open a read-only markdown float
      local function open_readonly_float(title, lines)
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  
        local W, H = vim.o.columns, vim.o.lines
        local w, h = math.floor(W * 0.8), math.floor(H * 0.8)
        local r, c = math.floor((H - h) / 2), math.floor((W - w) / 2)
  
        vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width    = w,
          height   = h,
          row      = r,
          col      = c,
          style    = "minimal",
          border   = "rounded",
          title    = title,
        })
        -- close on q or Esc - FIXED: removed 'buffer' from the options table
        vim.api.nvim_buf_set_keymap(buf, "n", "q",   "<cmd>close<CR>", { silent = true })
        vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<CR>", { silent = true })
      end
  
      -- 1) Floating list of all TODO/FIX/FIXME across project
      function TodoFloatProject()
        search.search(function(results)
          local lines = { "# Project TODOs", "" }
          for _, item in ipairs(results) do
            local rel = vim.fn.fnamemodify(item.filename, ":.")
            table.insert(lines,
              string.format("- [ ] **%s**:%d — %s", rel, item.lnum, item.message or item.text)
            )
          end
          if #lines == 2 then table.insert(lines, "_No TODOs found!_") end
          open_readonly_float("Project TODOs", lines)
        end, { keywords = nil, cwd = vim.fn.getcwd() })
      end
  
      -- 2) Floating list of TODOs in current buffer
      function TodoFloatFile()
        local buf0 = vim.api.nvim_get_current_buf()
        local lines = { "# File TODOs", "" }
        for i, ln in ipairs(vim.api.nvim_buf_get_lines(buf0, 0, -1, false)) do
          for _, kw in ipairs({ "TODO", "FIX", "FIXME" }) do
            if ln:find(kw, 1, true) then
              local msg = ln:sub(ln:find(kw, 1, true) + #kw + 1):match("^%s*(.*)") or ""
              table.insert(lines, string.format("- [ ] %d — %s", i, msg))
              break
            end
          end
        end
        if #lines == 2 then table.insert(lines, "_No TODOs in this file!_") end
        open_readonly_float("File TODOs", lines)
      end
  
      -- 3) Editable floating TODO.md in cwd
      function TodoEditProject()
        local file = vim.fn.getcwd() .. "/TODO.md"
        if vim.fn.filereadable(file) == 0 then
          -- create an empty TODO.md if it doesn't exist
          vim.fn.writefile({}, file)
        end
  
        -- Check if buffer already exists for this file
        local existing_buf = vim.fn.bufnr(file)
        local buf
        
        if existing_buf ~= -1 and vim.api.nvim_buf_is_loaded(existing_buf) then
          -- Use the existing buffer
          buf = existing_buf
        else
          -- Create a new buffer and load the file
          buf = vim.api.nvim_create_buf(true, false)
          -- Safely set the buffer name
          pcall(vim.api.nvim_buf_set_name, buf, file)
        end
        
        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
        vim.api.nvim_buf_set_lines(buf, 0, -1, true, vim.fn.readfile(file))
  
        local W, H = vim.o.columns, vim.o.lines
        local w, h = math.floor(W * 0.8), math.floor(H * 0.8)
        local r, c = math.floor((H - h) / 2), math.floor((W - w) / 2)
  
        vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width    = w,
          height   = h,
          row      = r,
          col      = c,
          style    = "minimal",
          border   = "rounded",
          title    = "Edit TODO.md",
        })
  
        -- === buffer‑local mappings for interactive actions ===
  
        -- (a) Add a new bullet below the cursor and start insert
        vim.keymap.set("n", "a", function()
          local row = vim.api.nvim_win_get_cursor(0)[1]
          vim.api.nvim_buf_set_lines(buf, row, row, false, { "- [ ] " })
          vim.api.nvim_win_set_cursor(0, { row + 1, 6 })
          vim.cmd("startinsert")
        end, { buffer = buf, desc = "Add TODO bullet" })
  
        -- (x) Toggle checkbox at current line
        vim.keymap.set("n", "x", function()
          local row = vim.api.nvim_win_get_cursor(0)[1]
          local line = vim.api.nvim_buf_get_lines(buf, row - 1, row, false)[1]
          if line:match("%[ %]") then
            line = line:gsub("%[ %]", "[x]")
          elseif line:match("%[x%]") then
            line = line:gsub("%[x%]", "[ ]")
          end
          vim.api.nvim_buf_set_lines(buf, row - 1, row, false, { line })
        end, { buffer = buf, desc = "Toggle TODO state" })
  
        -- (q) Save (with !) and close
        vim.keymap.set("n", "q", function()
          vim.cmd("write!")
          vim.cmd("close")
        end, { buffer = buf, desc = "Save & close" })
  
        -- (Esc) Close without saving
        vim.keymap.set("n", "<Esc>", function()
          vim.cmd("close")
        end, { buffer = buf, desc = "Close without saving" })
      end
  
      -- Expose the commands
      vim.api.nvim_create_user_command("TodoFloatProject", TodoFloatProject, {})
      vim.api.nvim_create_user_command("TodoFloatFile",    TodoFloatFile,    {})
      vim.api.nvim_create_user_command("TodoEditProject",  TodoEditProject,  {})
    end,
  }