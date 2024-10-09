-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Optional: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move foucus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move foucus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move foucus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move foucus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indows split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indows split [H]orizontal" })

-- Syay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

