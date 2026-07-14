---@brief
---
--- https://github.com/sqls-server/sqls
---
--- ```lua
--- vim.lsp.config('sqls', {
---   on_attach = function(client, bufnr)
---     require('sqls').on_attach(client, bufnr)
---   end,
--- })
--- ```
---
--- Language server for SQL, written in Go. Requires a connection to be configured
--- (via a `config.yml` next to the project or `~/.config/sqls/config.yml`) for
--- database-aware features; without one it still provides parsing and completion.

---@type vim.lsp.Config
return {
  cmd = { 'sqls' },
  filetypes = { 'sql', 'mysql' },
  root_markers = { 'config.yml', '.git' },
  settings = {},
}
