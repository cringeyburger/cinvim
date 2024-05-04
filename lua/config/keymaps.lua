vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

------------------------ Normal Mode -----------------------------------------

-- Redo
keymap("n", "U", "<C-r>", { silent = true, desc = "Redo" })

-- Window navigation
keymap({ "n", "i" }, "<C-h>", "<C-w>h", { silent = true, desc = "Go to left window" })
keymap({ "n", "i" }, "<C-j>", "<C-w>j", { silent = true, desc = "Go to lower window" })
keymap({ "n", "i" }, "<C-k>", "<C-w>k", { silent = true, desc = "Go to upper window" })
keymap({ "n", "i" }, "<C-l>", "<C-w>l", { silent = true, desc = "Go to right window" })

-- Resize
keymap("n", "<C-Up>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical :resize -2<CR>", { silent = true, desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical :resize +2<CR>", { silent = true, desc = "Increase window width" })

-- Next/Previous search result
keymap("n", "n", "nzzzv", { silent = true })
keymap("n", "N", "Nzzzv", { silent = true })

-- terminal
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { desc = "Python" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Float" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "Horizontal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "Vertical" })

-- Move Lines
keymap("n", "<A-Down>", ":m .+1<cr>==", { desc = "Move down" })
keymap("n", "<A-Up>", ":m .-2<cr>==", { desc = "Move up" })

-- Move down and up only one visual line
keymap("n", "j", "v:count==0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count==0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Buffer
-- Re-order to previous/next
keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
-- Goto buffer in position...
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>")
-- Pin/unpin buffer
keymap("n", "<A-p>", "<Cmd>BufferPin<CR>")
-- Close buffer
keymap("n", "<A-c>", "<Cmd>BufferClose<CR>")
-- Pick buffer
keymap("n", "<C-p>", "<Cmd>BufferPick<CR>")
-- Buffer order
keymap("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
keymap("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>")
keymap("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>")
keymap("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>")
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer", silent = true })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
-- Kill buffer
keymap("n", "<leader>t", ":bd<CR>", { desc = "Kill buffer", silent = true })
keymap("n", "<leader>ty", ":bd!<CR>", { desc = "Force kill buffer", silent = true })

-- Code Runner
keymap("n", "<leader>rr", ":RunFile<CR>", { desc = "Run File" })
keymap("n", "<leader>rc", ":RunClose", { desc = "Close CodeRunner" })

-- Split Windows
keymap("n", "<C-v>", "<CMD>vsplit<CR>", { desc = "Vertical Split", silent = true })
keymap("n", "<C-e>", "<CMD>split<CR>", { desc = "Horizontal Split", silent = true })

-- Toggle visibility of nvim tree
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "toggle neovim tree" })

-- Save
keymap("n", "<leader>w", ":w<CR>", { desc = "Save File", silent = true })

-- Show Alpha
keymap("n", "<leader>a", "<cmd>Alpha<CR>", { desc = "Show Alpha" })

--Remove Highlights
keymap("n", "<leader>n", ":noh<CR>", { desc = "Remove Highlights", silent = true })

-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
keymap("o", "A", ":<C-U>normal! mzggVG<CR>`z", { desc = "Delete ALL", silent = true })
keymap("x", "A", ":%yank +<CR>", { desc = "Copy ALL" })

-- Press jk fast to enter normal mode
keymap("i", "jk", "<ESC>")
keymap("i", "kj", "<ESC>")

-- Telescope
-- Search text
keymap(
  "n",
  "<C-f>",
  "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<CR>",
  { silent = true, desc = "Search Text" }
)
-- Change colorscheme
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorscheme" })
-- Find commands
keymap("n", "<leader>fC", "<cmd>Telescope commands<CR>", { desc = "Commands" })
-- Find files
keymap("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { desc = "Find files" })
-- Find help tags
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help" })
-- Open last search
keymap("n", "<leader>fl", "<cmd>Telescope resume<CR>", { desc = "Last Search" })
-- DONT KNOW
keymap("n", "<leader>fm", "<cmd>Telescope man_pages<CR>", { desc = "Man Pages" })
-- Open recent files
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent File" })
-- Open registers
keymap("n", "<leader>fR", "<cmd>Telescope registers<CR>", { desc = "Registers" })
-- Open keymaps
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
-- Open TODO
keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Todos" })

-- Git
-- Open lazygit
keymap("n", "<leader>gg", ":LazyGit<CR>", { desc = "Lazygit" })
-- Open file history
keymap("n", "<leader>gf", "<cmd>0Gclog<CR>", { desc = "File history" })
-- Next hunk
keymap("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", { desc = "Next Hunk" })
-- Prev hunk
keymap("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", { desc = "Prev Hunk" })
-- Git blame info
keymap("n", "<leader>gL", "<cmd>G blame<CR>", { desc = "Git Blame Information" })
-- Git log info
keymap("n", "<leader>gl", "<cmd>Gclog<CR>", { desc = "Git Log Information" })
-- Preview hunk
keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", { desc = "Preview Hunk" })
-- Push
keymap("n", "<leader>gP", "<cmd>G push<CR>", { desc = "Push..." })
-- Reset hunk
keymap("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", { desc = "Reset Hunk" })
-- Reset buffer
keymap("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", { desc = "Reset Buffer" })
-- Stage hunk
keymap("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", { desc = "Stage Hunk" })
-- Undo stage hunk
keymap("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", { desc = "Undo Stage Hunk" })
-- Open changed file
keymap("n", "<leader>go", "<cmd>Telescope git_status<CR>", { desc = "Open changed file" })
-- Checkout branch
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Checkout branch" })
-- Checkout commit
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Checkout commit" })
-- Diff
keymap("n", "<leader>gd", "<cmd>lua require('utils.diff')()<CR>", { desc = "Diff With" })

-- Hop
-- Hop in the current line
keymap("n", "<leader>hw", "<cmd>HopWordCurrentLine<CR>", { desc = "Hop Word In Current Line" })
-- Find global pattern and hop anywhere
keymap("n", "<leader>hp", "<cmd>HopPattern<CR>", { desc = "Hop Word With Pattern" })

-- Trouble
-- Show trouble
keymap("n", "<leader>xx", function()
  require("trouble").toggle()
end, { desc = "Show trouble" })
-- Workspace diagnostics
keymap("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end, { desc = "Workspace diagnostics" })
-- Document diagnostics
keymap("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end, { desc = "Document diagnostics" })
-- Open quickfix
keymap("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end, { desc = "Open Quickfix" })
-- DONT KNOW
keymap("n", "<leader>xo", function()
  require("trouble").toggle("loclist")
end, { desc = "Loc list" })
-- LSP references
keymap("n", "<leader>xl", function()
  require("trouble").toggle("lsp_references")
end, { desc = "Lsp references" })

-- lsp
keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", { desc = "Format" })
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", { desc = "Codelens Action" })
keymap("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })

-- Competitest
keymap("n", "<leader>ca", "<cmd>CompetiTest add_testcase<CR>", { desc = "Add Testcase" })
keymap("n", "<leader>ce", "<cmd>CompetiTest edit_testcase<CR>", { desc = "Edit Testcase" })
keymap("n", "<leader>cd", "<cmd>CompetiTest delete_testcase<CR>", { desc = "Delete Testcase" })
keymap("n", "<leader>cr", "<cmd>CompetiTest run<CR>", { desc = "Run Testcases" })
keymap("n", "<leader>cit", "<cmd>CompetiTest receive testcases<CR>", { desc = "Receive testcases" })
keymap("n", "<leader>cip", "<cmd>CompetiTest receive problem<CR>", { desc = "Receive problem" })
keymap("n", "<leader>cic", "<cmd>CompetiTest receive contest<CR>", { desc = "Receive contest" })

---------------------------------- Insert Mode --------------------------

-- Rename
keymap("i", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "rename" })

-- Move lines down
keymap("i", "<A-Down>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
-- Move lines up
keymap("i", "<A-Up>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

------------------------------------ Visual Mode ------------------------

-- Move text down
keymap("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- Move text up
keymap("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- DONT KNOW
keymap("v", "p", '"_dP', { silent = true })

---------------------------------- Visual Block Mode ------------------------

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
keymap("x", "K", ":move '<-2<CR>gv-gv", { silent = true })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

---------------------------------- Terminal Mode ---------------------------

-- <C-\>: toggle terminal window
-- Alt+x: exit terminal mode
keymap("t", "<A-x>", [[<C-\><C-n>]], { silent = true })
