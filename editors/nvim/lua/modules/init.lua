local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print "Failed to require packer"
	return
end

-- Have packer use a popup window
packer.init { display = { open_fn = function() return require("packer.util").float { border = "rounded" } end } }


-- Install plugins
return packer.startup(function(use)
	local vim_path = vim.fn.stdpath('config')
	local modules_dir = vim_path .. '/lua/modules'
	local list = {}
	local tmp = vim.split(fn.globpath(modules_dir, '*/plugins.lua'), '\n')
	for _, f in ipairs(tmp) do
		list[#list + 1] = string.match(f, 'lua/(.+).lua$')
	end
	for _, m in ipairs(list) do
		require(m)
	end
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then require("packer").sync() end
end)
