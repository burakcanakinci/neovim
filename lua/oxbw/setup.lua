require('nvim-autopairs').setup{}
require('palenightfall').setup({})

require'lspconfig'.clangd.setup{}
-- require('lualine').setup {
--     -- options = { theme  = { disable_background = true }, },
-- }

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    mapping = {
        -- ['<Tab>'] = cmp.mapping.confirm({ select = true}),
        ['<return>'] = cmp.mapping.confirm({ select = true}),
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
})

-- formatter
vim.g.neoformat_cpp_clangformat = {
    exe = 'clang-format',
    args = {},
    stdin = 1,
}

-- Comment out
require('nvim_comment').setup()

-- LUALINE status bar

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'palenight',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics', 'buffers'},
        lualine_c = {''},
        lualine_x = {'filename', 'fileformat', ''},
        lualine_y = {'progress','searchcount'},
        lualine_z = {'', 'filetype'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- LUALINE end
