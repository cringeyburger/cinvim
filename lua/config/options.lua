local options = {
  -- Better colors -> Set termgui colors
  termguicolors = true,

  timeoutlen = 500, -- Time to wait for a mapped sequence to complete (ms)
  updatetime = 200, -- Faster completion (default: 400ms)

  -- Number of screen lines to keep above and below cursor
  scrolloff = 8,
  sidescrolloff = 8,

  -- Better UI Settings
  number = true, -- Set number column on the left
  numberwidth = 5, -- Gap between the numver col and the left edge
  relativenumber = true, -- Relative numbering
  signcolumn = "yes:1", -- Creates a gap between the num and edge for signs
  cursorline = true, -- Highlight the current line
  title = true, -- Show title in terminal header

  -- Better Editing
  expandtab = true, -- Converts tabs to spaces
  cmdheight = 1, -- NVIM CMD height
  fileencoding = "utf-8", -- File Encoding
  hlsearch = true, -- Highlights all instances of the word searched
  mouse = "a", -- Allow mouse
  pumheight = 10, -- Pop up menu height
  showtabline = 2, -- Show tabs
  smartindent = true, -- Smart indent
  smartcase = true, -- Smart case
  linebreak = true, -- Instead of breaking the word into pieces, when the lines are long, the whole word is shifted to a new line
  guifont = "FiraCode Nerd Font:h14", -- Font and size
  cindent = true, -- DK
  wrap = true, -- DK
  textwidth = 310, -- DK
  tabstop = 4, -- Length of a tab
  shiftwidth = 4, -- Number of spaces inserted for each indentation
  softtabstop = -1, -- DK (disables softtabsoft, but dk what it is)
  list = true, -- Makes the space into dots and stuff
  listchars = "trail:•,nbsp:◇,tab:→ ,extends:»,precedes:«", -- Changes the space into these characters
  clipboard = "unnamedplus", -- Allows neovim to access the system clipboard
  ignorecase = true, -- Ignore case in search patterns
  incsearch = true, -- Enable incsearch
  conceallevel = 0, -- So that `` is visible in markdown files
  concealcursor = "",
  completeopt = { "menuone", "noselect" }, -- Mostly just for cmp
  autoread = true, -- When file changed, autoread it
  errorbells = false, -- No error bells
  showmode = false, -- We don't need to see things like -- INSERT -- anymore
  fillchars = {
    diff = "",
    fold = " ",
    eob = " ",
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
    foldclose = "",
    foldopen = "",
    foldsep = " ",
  },
  backup = false, -- Don't create a backup file
  writebackup = false,
  undofile = true, -- Enable persistent undo
  swapfile = false, -- Don't create a swap file
  history = 50, -- DK
  splitright = true, -- Force all vertical splits to go to the right of current window
  splitbelow = true, -- Force all horizontal splits to go below current window
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess = "filnxtToOFWIcC"
end
