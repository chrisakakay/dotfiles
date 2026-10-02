-- Zig
vim.lsp.config["zls"] = {
  cmd = { "zls" },
  filetypes = { "zig" },
  root_markers = { 'build.zig' },
  single_file_support = true,
}

vim.lsp.enable('zls')
