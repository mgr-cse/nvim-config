vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- indentation
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.smartindent = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

if vim.env.TMUX ~= nil then
	vim.g.clipboard = {
		['name'] = 'myClipboard',
		['copy'] = {
			['+'] = {'tmux', 'load-buffer', '-'},
			['*'] = {'tmux', 'load-buffer', '-'},
		},
		['paste'] = {
			['+'] = {'tmux', 'save-buffer', '-'},
			['*'] = {'tmux', 'save-buffer', '-'},
		},
		['cache_enabled'] = 1,
	}
end
