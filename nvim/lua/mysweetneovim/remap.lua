-- ustawia klawisz leader na spację
vim.g.mapleader = " "

-- while in normal mode, if I press leader key (above, czyli spacja) + "p" + "v", execute command "vim.cmd.Ex"
-- <Po tej zmianie kombinacja Space + pv otworzy eksplorator>
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- pozwoli na przenoszenie zaznaczonego tekstu do góry i ładnie indentuje np. wewnątrz funkcji
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

