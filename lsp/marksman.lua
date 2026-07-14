---@brief
---
--- https://github.com/artempyanykh/marksman
---
--- Marksman is a language server for Markdown that provides completion,
--- go-to-definition, find references, diagnostics, and more for wiki-style links.
---
--- `marksman` can be installed via `mason` or by downloading a prebuilt binary
--- from the [releases page](https://github.com/artempyanykh/marksman/releases).

---@type vim.lsp.Config
return {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
  root_markers = { '.marksman.toml', '.git' },
}
