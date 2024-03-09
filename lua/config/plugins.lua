-- Plugin management (using packer.nvim)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  vim.api.nvim_command(
    '!git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim')
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('config.telescope').setup()
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
end)
