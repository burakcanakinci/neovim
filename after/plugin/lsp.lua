vim.g.lsp_zero_extend_lspconfig = 0
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
 lsp_zero.default_keymaps({buffer = bufnr})
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
 local cmp_select = {behavior = cmp.SelectBehavior.Select}
 local cmp_mappings = lsp_zero.defaults.cmp_mappings({
   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
   ["<C-Space>"] = cmp.mapping.complete(),
 })
-- 
 cmp_mappings['<Tab>'] = nil
 cmp_mappings['<S-Tab>'] = nil
-- 
-- lsp.setup_nvim_cmp({
-- 	mapping = cmp_mappings
-- })
-- 
 lsp_zero.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
 	error = 'E',
 	warn = 'W',
         hint = 'H',
         info = 'I'
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
 lsp_zero.setup()
-- 
 vim.diagnostic.config({
 	virtual_text = true
 })
