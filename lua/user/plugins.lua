local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    "ThePrimeagen/vim-be-good",
    {
        "mrjones2014/smart-splits.nvim",
        opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    'folke/tokyonight.nvim',
    "EdenEast/nightfox.nvim",
    "ellisonleao/gruvbox.nvim",
    "rebelot/kanagawa.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "rebelot/heirline.nvim",
        -- You can optionally lazy-load heirline on UiEnter
        -- to make sure all required plugins and colorschemes are loaded before setup
        -- event = "UiEnter",
        config = function()
            require("heirline").setup({})
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents,
    },
    'neovim/nvim-lspconfig',
    'simrat39/rust-tools.nvim',
    "github/copilot.vim",
    "lewis6991/gitsigns.nvim",
    { "hardhackerlabs/theme-vim",          name = "hardhacker" },
    { "nicholas-stevenson/sendtomaya.vim", branch = "execfile_python39_changes" },
    {
        'projekt0n/github-nvim-theme',
        tag = 'v0.0.7'
    },
    "jose-elias-alvarez/null-ls.nvim",
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-vsnip',
        },
    },
}


local opts = {}

require("lazy").setup(plugins, opts)
require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            ".git",
            ".idea",
            ".vscode",
            "msn\\maya\\vendor",
            "msn\\maya\\cpp",
            "msn\\resources\\",
            "__pycache__",
        }
    }
})
require("mason").setup()
require("gitsigns").setup()
require("nvim-treesitter.configs").setup({
    ensure_installed = { "rust", "lua", "python", "vim" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black
    },
})

vim.g.send_to_maya_host = "127.0.0.1"
vim.g.send_to_maya_port = 7002
vim.g.send_to_maya_prefer_language = 'python'
