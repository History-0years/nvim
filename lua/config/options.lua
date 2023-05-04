local options = {
  clipboard      = "unnamed,unnamedplus",   --- Copy-paste between vim and everything else
  fileencoding   = "utf-8",                 --- The encoding written to file
  hlsearch       = true,                    --- highlight all matches on previous search pattern
  number         = true,                    --- Shows current line number
  relativenumber = false,                   --- Disables relative number
  cursorline     = true,                    --- Highlight of current line
  cursorcolumn   = false,                   --- No highlight of current column 


  cmdheight      = 0,                       --- Give more space for displaying messages
  completeopt    = "menu,menuone,noselect", --- Better autocompletion
  emoji          = false,                   --- Fix emoji display
  expandtab      = true,                    --- Use spaces instead of tabs
  foldlevel      = 99,                      --- Using ufo provider need a large value
  foldlevelstart = 99,                      --- Expand all folds by default
  ignorecase     = true,                    --- Needed for smartcase
  laststatus     = 3,                       --- Have a global statusline at the bottom instead of one for each window
  lazyredraw     = true,                    --- Makes macros faster & prevent errors in complicated mappings
  mouse          = "a",                     --- Enable mouse
  pumheight      = 10,                      --- Max num of items in completion menu
  scrolloff      = 8,                       --- Always keep space when scrolling to bottom/top edge
  shiftwidth     = 2,                       --- Change a number of space characters inserted for indentation
  showtabline    = 2,                       --- Always show tabs
--  signcolumn     = "yes:2",                 --- Add extra sign column next to line number
  smartcase      = true,                    --- Uses case in search
  smartindent    = true,                    --- Makes indenting smart
  smarttab       = true,                    --- Makes tabbing smarter will realize you have 2 vs 4
  softtabstop    = 2,                       --- Insert 2 spaces for a tab
  splitright     = true,                    --- Vertical splits will automatically be to the right
  swapfile       = false,                   --- Swap not needed
  tabstop        = 2,                       --- Insert 2 spaces for a tab
  termguicolors  = true,                    --- Correct terminal colors
  timeoutlen     = 500,                     --- Faster completion (cannot be lower than 200 because then commenting doesn't work),modify it by 500, my typing is slow....
  undofile       = true,                    --- Sets undo to file
  updatetime     = 100,                     --- Faster completion
  viminfo        = "'1000",                 --- Increase the size of file history
  wildignore     = "*node_modules/**",      --- Don't search inside Node.js modules (works for gutentag)
  wrap           = false,                   --- Display long lines as just one line
  writebackup    = false,                   --- Not needed
  -- Neovim defaults
  autoindent     = true,                    --- Good auto indent
  backspace      = "indent,eol,start",      --- Making sure backspace works
  backup         = false,                   --- Recommended by coc
  conceallevel   = 0,                       --- Show `` in markdown files
  errorbells     = false,                   --- Disables sound effect for errors
  incsearch      = true,                    --- Start searching before pressing enter
  showmode       = false,                   --- Don't show things like -- INSERT -- anymore
}

local globals = {
  mapleader                   = ' ',        --- Map leader key to SPC
  speeddating_no_mappings     = 1,          --- Disable default mappings for speeddating
}

vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.opt.fillchars:append('stl: ');
vim.opt.fillchars:append('eob: ');
vim.opt.fillchars:append('fold: ');
vim.opt.fillchars:append('foldopen: ');
vim.opt.fillchars:append('foldsep: ');
vim.opt.fillchars:append('foldclose:');

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]       -- make a prefix-suffix a total word to change
