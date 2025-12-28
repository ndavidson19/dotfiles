local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================================
-- MOVEMENT (WASD)
-- =========================================================
map("n", "w", "k", opts)
map("n", "a", "h", opts)
map("n", "s", "j", opts)
map("n", "d", "l", opts)

-- Turbo movement (Shift)
map("n", "W", "5k", opts)
map("n", "A", "5h", opts)
map("n", "S", "5j", opts)
map("n", "D", "5l", opts)

-- =========================================================
-- WORD MOTIONS (Q E R F)
-- =========================================================
map("n", "q", "b", opts)      -- previous word
map("n", "e", "w", opts)      -- next word
map("n", "r", "e", opts)      -- end of word
map("n", "f", "ge", opts)     -- end of previous word

-- =========================================================
-- EDIT ACTIONS (Z C V)
-- =========================================================
map("n", "z", "dw", opts)     -- delete word
map("n", "Z", "d$", opts)     -- delete to EOL

map("n", "c", "yw", opts)     -- copy word
map("n", "C", "y$", opts)     -- copy to EOL

map("n", "v", "p", opts)      -- paste
map("n", "V", "p`]", opts)    -- paste and move cursor to end

-- Visual mode versions
map("v", "z", "d", opts)      -- delete selection
map("v", "c", "y", opts)      -- copy selection
map("v", "v", "p", opts)      -- paste over selection

-- =========================================================
-- INSERT MODE ENTRY + EXIT
-- =========================================================
map("n", "<Space>", "i", opts)        -- enter insert
map("n", "<CR>", "o", opts)           -- new line
map("n", "<S-CR>", "O", opts)         -- new line above
map("n", "<S-Space>", "a", opts)      -- append insert
map("i", "<C-Space>", "<Esc>", opts)  -- exit insert (Ctrl-Space)

-- =========================================================
-- VISUAL MODE ENTRY (Shift+Q)
-- =========================================================
map("n", "Q", "v", opts)                  -- normal → visual
map("i", "Q", "<Esc>v", opts)            -- insert → visual

-- =========================================================
-- I O P → RESERVED FOR PLUGINS
-- =========================================================
-- Example placeholder (disabled):
-- map("n", "i", ":Telescope find_files<CR>", opts)
-- map("n", "o", ":Lazy<CR>", opts)
-- map("n", "p", ":Oil<CR>", opts)

-- =========================================================
-- BUFFER CONTROLS (J K L)
-- =========================================================
map("n", "j", ":bnext<CR>", opts)
map("n", "k", ":bprev<CR>", opts)
map("n", "<leader>q", "<cmd>w|bd<cr>", opts)
