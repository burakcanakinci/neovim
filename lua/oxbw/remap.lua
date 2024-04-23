vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
        require("vim-with-me").StartVimWithMe()
    end)
    vim.keymap.set("n", "<leader>svwm", function()
            require("vim-with-me").StopVimWithMe()
        end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-j>", "<Esc>")
vim.keymap.set("v", "<C-j>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/oxbw/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
   vim.cmd("so")
end)

-- Open terminal on the right side in the directory of the current file
-- vim.keymap.set("n", "<leader>t", [[:rightbelow vsp | term cd %:p:h && $SHELL<CR>]], { silent = true })
vim.keymap.set("n", "<leader>t", [[:rightbelow vsp | term bash -c "cd '%:p:h' && exec bash"<CR>]], { silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>t', [[:term bash -c "cd '%:p:h' && exec bash"]], { noremap = true, silent = true })

-- Close terminal window
vim.keymap.set("t", "<C-w><C-q>", "<C-\\><C-n>:q<CR>", { silent = true })

-- Switch back to normal mode from terminal insert mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Switch to terminal insert mode
-- vim.keymap.set("n", "<leader>ti", ":term<CR>i", { noremap = true, silent = true })

-- switch window to left
vim.keymap.set("n", "<C-H>", "<C-W>h", { noremap = true, silent = true })
-- switch window to right
vim.keymap.set("n", "<C-L>", "<C-W>l", { noremap = true, silent = true })
-- Switch to the window below
vim.keymap.set("n", "<C-J>", "<C-W>j", { noremap = true, silent = true })
-- Switch to the window above
vim.keymap.set("n", "<C-K>", "<C-W>k", { noremap = true, silent = true })

-- next/previous buffer
vim.keymap.set("n", "<Leader>h", ":bprevious<CR>")
vim.keymap.set("n", "<Leader>l", ":bnext<CR>")
-- vim.keymap.set("n", "<A-Right>", ":bn<CR>")  -- Next buffer with Alt+Right Arrow
-- vim.keymap.set("n", "<A-Left>", ":bp<CR>")  -- Previous buffer with Alt+Left Arrow

-- buffer wipe
vim.keymap.set("n", "<leader>q", ":bw!<CR>")
