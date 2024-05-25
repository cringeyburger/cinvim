local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.localmapleader = " "


local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end


require("config.options")
require("config.keymaps")
require("config.neovide")
require("config.autocommands")


return lazy.setup("plugins", {
  git = {
    url_format = "https://www.github.com/%s.git",
  },
  change_detection = {
    notify = false,
  },
})
