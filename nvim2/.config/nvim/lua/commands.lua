local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('axel', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = 'axel',
  callback = function()
    vim.hl.on_yank()
  end,
})

autocmd('QuickFixCmdPost', {
   desc = "Load cfilter after generating a quickfix list",
   group = 'axel',
   callback = function()
      vim.cmd.packadd "cfilter"
   end
})

autocmd('BufWritePost', {
   group = 'axel',
   pattern = { "*.adoc" },
   callback = function()
      vim.cmd "Asciidoctor2PDF"
   end
})

autocmd('BufEnter', {
   desc = "formatoptions is buffer local...",
   group = 'axel',
   pattern = "*",
   callback = function()
      vim.opt.formatoptions:remove { "c", "r", "o" }
   end
})

autocmd('BufWritePre', {
   desc = "Delete post-line whitespaces",
   group = "axel",
   pattern = '*',
   command = ":%s/\\s\\+$//e"
})

