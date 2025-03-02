-- ustaw leader na spację
vim.g.mapleader = " "

-- ustaw skrót do wyjścia z aktualnie otwartego pliku
vim.keymap.set("n", "<leader>fb", vim.cmd.Ex)

-- pozwala na przenoszczenie zaznaczonego tekstu ładnie go indentując
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


--[[
local builtin = require('telescope.builtin')
vim.keymap.set(
	'n',
	'<leader>pf',
	builtin.find_files,
	{ desc = 'Telescope find files' }
)

vim.keymap.set (
	'n',
	'<C-p>',
	builtin.git_files,
	{ desc = 'Telescope find git files' }
)

vim.keymap.set(
	'n',
	'<leader>ps',
	function()
		builtin.grep_string(
		{ search = vim.fn.input("Grep > ") }
		);
	end,
	{ desc = 'Telescope find git files' }
)
]]
