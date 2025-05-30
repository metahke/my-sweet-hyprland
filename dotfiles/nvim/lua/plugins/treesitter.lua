return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "css", "python", "javascript", "html" },
            sync_install = false,
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
            additional_vim_regex_highlighting = false,
        })
    end
}
