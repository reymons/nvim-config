vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}}
    }
    use {
        "nvim-treesitter/playground",
        requires = {{"nvim-treesitter/nvim-treesitter"}}
    }
    use {
        "~/nvim-themes",
        requires = {{"rktjmp/lush.nvim"}}
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig"
        }
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer"
        }
    }
    use "windwp/nvim-ts-autotag"
    use "tpope/vim-fugitive" -- git utils
    use "vim-utils/vim-man"
end)
