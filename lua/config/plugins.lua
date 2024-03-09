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
end)
