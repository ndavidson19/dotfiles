return {
  "danymat/neogen",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local neogen = require("neogen")

    neogen.setup({
      snippet_engine = "luasnip",
      languages = {
        rust = {
          template = {
            annotation_convention = "rustdoc", -- or "rust_alternative"
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>nf", function()
      neogen.generate({ type = "func" })
    end, { noremap = true, silent = true, desc = "Generate function" })

    vim.keymap.set("n", "<leader>nt", function()
      neogen.generate({ type = "type" })
    end, { noremap = true, silent = true, desc = "Generate type" })
  end,
}
