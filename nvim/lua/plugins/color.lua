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

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    -- { "rose-pine/neovim",      name = "rose-pine" },
    -- { "morhetz/gruvbox",       name = "gruvbox", config = ColorMyGruvbox },
    -- { "folke/tokyonight.nvim", name = "tokyonight" },
    -- { "w0ng/vim-hybrid",       name = "hybrid" },
    -- { "i3d/vim-jimbothemes",   name = "breakingbad", config = ColorMyBreakingBad },
    "chrisbra/Colorizer",
    -- "lurst/austere.vim",
    { "blazkowolf/gruber-darker.nvim", name = "gruber-darker", config = ColorMyGruber },
}
