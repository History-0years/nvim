local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- latest stable release
    lazypath,
})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("config.plugins", {
  defaults = { lazy = true },
  -- install = { colorscheme = { "tokyonight" }},
  checker = { enable = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
  ui = {
    border = EcoVim.ui.float.border,
   -- border = rounded,
  },
})

