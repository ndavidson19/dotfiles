return {
    "folke/which-key.nvim",
    opts = {},
    config = function(_, opts)
        require("which-key").setup(opts)

        local wk = require("which-key")
        wk.add({
            { "<leader>f", group = "Find" },
            { "<leader>d", group = "Debug" },
            { "<leader>g", group = "Git" },
            { "<leader>n", group = "Neogen" },
            { "<leader>t", group = "Testing" },
            { "<leader>v", group = "Lsp" },
            { "<leader>m", group = "Misc" },
        })

        vim.keymap.set("n", "<C-h>", "<cmd>WhichKey<CR>", { silent = true, desc = "Show which-key help" })
    end,
}