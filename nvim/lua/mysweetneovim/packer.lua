-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- load telescope.nvim plugin
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- load rose-pine color palette
	use ({ 
		"rose-pine/neovim", 
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	})
	-- load treesitter.nvim plugin
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- load harpoon.nvim plugin
	use('theprimeagen/harpoon')

	-- load undotree.nvim plugin
	use('mbbill/undotree')

	-- load vim-fugitive.nvim plugin
	use('tpope/vim-fugitive')

	-- load lsp-zero.nvim plugin (UNMAINTAINED)
	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})
end)

