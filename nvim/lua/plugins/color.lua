function ColorMyAustere()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("austere")

    vim.api.nvim_set_hl(0, "Constant", { fg = "#ce5252" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#252525" })
end

function ColorMyBreakingBad()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("breakingbad")

    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn",   { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine",   { bg = "none" })
    vim.api.nvim_set_hl(0, "VertSplit",    { bg = "none", fg = "#444444" })
    vim.api.nvim_set_hl(0, "Comment", { bg = "none" })

end

function ColorMyOneDarkPro()
  vim.opt.termguicolors = true
  vim.opt.background = "dark"

  require("onedarkpro").setup({
    -- Pick a variant: "onedark", "onedark_dark", "onedark_vivid", "onelight", etc.
    colorscheme = "onedark",
    options = {
      transparency = true, -- ✅ built-in transparency
    },
  })

  vim.cmd.colorscheme("onedark")
end

function ColorMyGruvbox()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("gruvbox")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function ColorMyRosePine()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("rose-pine")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function ColorMyGruber()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("gruber-darker")

    -- Transparent background for main UI
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

    -- Transparent background for LSP floating windows
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "LspFloatWinNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { bg = "none" })

    -- Transparent background for completion menu
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

    -- Transparent background for Telescope
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })

    -- Optional: make window separators transparent too
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
end


return {
    -- { "rose-pine/neovim",      name = "rose-pine" },
    -- { "morhetz/gruvbox",       name = "gruvbox", config = ColorMyGruvbox },
    -- { "folke/tokyonight.nvim", name = "tokyonight" },
    -- { "w0ng/vim-hybrid",       name = "hybrid" },
    -- { "i3d/vim-jimbothemes",   name = "breakingbad", config = ColorMyBreakingBad },
    -- "chrisbra/Colorizer",
    -- "lurst/austere.vim",
    { "olimorris/onedarkpro.nvim", priority = 1000, config = ColorMyOneDarkPro }
    -- { "blazkowolf/gruber-darker.nvim", name = "gruber-darker", config = ColorMyGruber },
}
