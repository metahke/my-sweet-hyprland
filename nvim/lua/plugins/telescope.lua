return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies =  {'nvim-lua/plenary.nvim'},
    lazy = false,
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup()

        vim.keymap.set('n', '<leader>fs', builtin.find_files, { desc = 'Telescope find files' } )
        
        --[[
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end, { desc = 'Telescope find git files' })]]
    end
}
