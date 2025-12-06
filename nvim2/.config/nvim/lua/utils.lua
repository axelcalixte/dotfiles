local M = {}

 M.map = function(mode, l, r, opts)
   opts = opts or {}
   opts.buffer = bufnr
   vim.keymap.set(mode, l, r, opts)
 end

M.enable_completion = function(client, bufnr)
   vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
         return { abbr = item.label:gsub('%b()', '') }
      end,
   })
end

M.get_directories = function(paths)
    local directories = {}
    for _, path in ipairs(paths) do
       for _, dir in ipairs(vim.fn.glob(path .. '/*', 0, 1)) do
           if vim.fn.isdirectory(dir) == 1 then
               table.insert(directories, dir)
           end
       end
    end
    return directories
end

return M
