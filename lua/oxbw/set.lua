vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""

-- Disable next line automatic comment
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Transparent background

vim.cmd([[
    augroup MyHighlight
        autocmd!
        autocmd VimEnter * highlight Normal guibg=none ctermbg=none
        autocmd VimEnter * highlight NonText ctermbg=none guibg=none
        autocmd VimEnter * highlight CursorLine guibg=none ctermbg=none
        autocmd VimEnter * highlight StatusLine guibg=none ctermbg=none
    augroup END
]])

vim.cmd('highlight Normal guibg=none ctermbg=none')
vim.cmd('highlight NonText guibg=none ctermbg=none')
vim.cmd('highlight CursorLine guibg=none ctermbg=none')
vim.cmd('highlight StatusLine guibg=none ctermbg=none')
vim.cmd('autocmd VimEnter * highlight StatusLine guibg=none ctermbg=none')
