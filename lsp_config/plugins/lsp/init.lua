local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

-- lsp_signature.setup({hint_enable=false})
require "lsp_config.plugins.lsp.mason"
require("lsp_config.plugins.lsp.handlers").setup()
