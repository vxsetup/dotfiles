-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
 	{"phaazon/hop.nvim"},
	{"nvim-neo-tree/neo-tree.nvim",
    		branch = "v3.x",
   		dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", 
		"MunifTanjim/nui.nvim"
    		}
	},
	{"nvim-treesitter/nvim-treesitter"},
	{'projekt0n/github-nvim-theme',
  	name = 'github-theme',
  	lazy = false, -- make sure we load this during startup if it is your main colorscheme
  	priority = 1000, -- make sure to load this before all the other start plugins
  	config = function()
    		require('github-theme').setup({})
    	vim.cmd('colorscheme github_dark')
  	end,
 	 },
	 {"hrsh7th/cmp-buffer"},
	 {"hrsh7th/cmp-path"},
	 {"hrsh7th/cmp-cmdline"},
	 {"hrsh7th/nvim-cmp"},
	 {"nvim-telescope/telescope.nvim",
 	 tag = "0.1.8",
 	 dependencies = { 'nvim-lua/plenary.nvim' }
 	 },
	 {"windwp/nvim-autopairs",
 	 event = "InsertEnter",
 	 config = true},
	 {"windwp/nvim-ts-autotag"},
	 {'akinsho/bufferline.nvim', 
	 version = "*", 
	 dependencies = 'nvim-tree/nvim-web-devicons'},
	{"terrortylor/nvim-comment"},
	{
  	'nvimdev/dashboard-nvim',
 	 event = 'VimEnter',
  	config = function()
    	require('dashboard').setup {
      -- config
    			}
	 end,
 	 dependencies = { {'nvim-tree/nvim-web-devicons'}}
	 },		
 })
