vim.g.lsp_zero_extend_lspconfig = 0
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
 lsp_zero.default_keymaps({buffer = bufnr})
 lsp_zero.highlight_symbol(client, bufnr)
end)


require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'clangd', 'lua_ls', 'tsserver', 'pyright'},
	handlers = {
	        lsp_zero.default_setup,
	}
})

 lsp_zero.preset("recommended")
-- 
-- -- Fix Undefined global 'vim'
-- lsp.nvim_workspace()
-- 
-- 
 local cmp = require('cmp')
--  local cmp_select = {behavior = cmp.SelectBehavior.Select}
--  local cmp_mappings = lsp_zero.defaults.cmp_mappings({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--    ["<C-Space>"] = cmp.mapping.complete(),
--  })
-- -- 
--  cmp_mappings['<Tab>'] = nil
--  cmp_mappings['<S-Tab>'] = nil
-- 
-- lsp.setup_nvim_cmp({
-- 	mapping = cmp_mappings
-- })
-- 
 lsp_zero.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
     }
 })
-- 
-- 
 lsp_zero.on_attach(function(client, bufnr)
 	  local opts = {buffer = bufnr, remap = false}
	  vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
 	  vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
 	  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
 	  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
 	  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
 	  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
 	  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
 	  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
 	  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
 	  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
 end)
-- 
lsp_zero.setup({
    on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(bufnr, true)
    end
end
})
-- 
 vim.diagnostic.config({
 	underline = true,
    virtual_text = {
        prefix = "",
        severity = nil,
        source = "if_many",
        format = nil,
    },
    signs = true,
    severity_sort = true,
    update_in_insert = false,
 })

 local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    documentation = {
      max_height = 15,
      max_width = 60,
    }
  },
  formatting = {
    fields = {'abbr', 'menu', 'kind'},
    format = function(entry, item)
      local short_name = {
        nvim_lsp = 'LSP',
        nvim_lua = 'nvim'
      }

      local menu_name = short_name[entry.source.name] or entry.source.name

      item.menu = string.format('[%s]', menu_name)
      return item
    end,
  },
})
