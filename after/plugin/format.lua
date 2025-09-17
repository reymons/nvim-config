local formatter_map = {
  go = "go fmt",
  js = "prettier --write",
  mjs = "prettier --write",
  cjs = "prettier --write",
  ts = "prettier --write",
  jsx = "prettier --write",
  tsx = "prettier --write",
  json = "prettier --write",
  css = "prettier --write",
  html = "prettier --write",
}

vim.keymap.set('n', '<leader>gf', function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == '' then
    print("No file associated with this buffer.")
    return
  end

  local ext = vim.fn.fnamemodify(file, ":e")
  local cmd_format = formatter_map[ext]
  if not cmd_format then
      print("No formatter configured for ." .. ext)
      return
  end

  local cmd = cmd_format .. " " .. vim.fn.shellescape(file)
  local output = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    print("Formatter error:\n" .. output)
  else
    vim.cmd('edit') -- reload buffer
    print("Formatted")
  end
end, { desc = "Format current buffer based on file type" })

