local neogit = require('neogit')
neogit.setup{}

-----------------------------------
--           COQ setup           --
-----------------------------------
--vim.cmd("let g:coq_settings = { 'auto_start': v:true}")
vim.g.coq_settings = { ["auto_start"] = true, ["display.icons.mode"] = "none" }
local coq = require('coq')

-----------------------------------
--        nvim-autopairs         --
-----------------------------------
require('nvim-autopairs').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

-----------------------------------
--           fzf-lua             --
-----------------------------------
require('fzf-lua').setup{}

-----------------------------------
--     Language Servers          --
-----------------------------------

local system_name = "Linux"
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/home/axel/.local/share/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup(coq.lsp_ensure_capabilities({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}))
if vim.fn.has('nvim-0.5') then
vim.cmd([[
    augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'jdtls.sh'}})
    augroup end
  ]])
end

-- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
vim.cmd([[ autocmd FileType java lua require('jdtls').start_or_attach({ cmd = {'jdtls.sh', '/home/axel/.config/jdtls-workspace' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')}, root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'}) }) ]])

--require('jdtls').start_or_attach({
--cmd = {'jdtls.sh', '/home/axel/.config/jdtls-workspace' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')}, root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})
--})

-----------------------------------
--     lspconfig bindings        --
-----------------------------------

local nvim_lsp = require('lspconfig')
-- icons local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
 --[[ icons protocol.CompletionItemKind = {
    '';   -- Text          = 1;
    '';   -- Method        = 2;
    'ƒ';   -- Function      = 3;
    '';   -- Constructor   = 4;
    '識';  -- Field         = 5;
    '';   -- Variable      = 6;
    '';   -- Class         = 7;
    'ﰮ';   -- Interface     = 8;
    '';   -- Module        = 9;
    '';   -- Property      = 10;
    '';   -- Unit          = 11;
    '';   -- Value         = 12;
    '了';  -- Enum          = 13;
    '';   -- Keyword       = 14;
    '﬌';   -- Snippet       = 15;
    '';   -- Color         = 16;
    '';   -- File          = 17;
    '渚';  -- Reference     = 18;
    '';   -- Folder        = 19;
    '';   -- EnumMember    = 20;
    '';   -- Constant      = 21;
    '';   -- Struct        = 22;
    '鬒';  -- Event         = 23;
    'Ψ';   -- Operator      = 24;
    '';   -- TypeParameter = 25;
  } --]]

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

nvim_lsp.tsserver.setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
))
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--[[local servers = { "tsserver", "bashls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }))
end
--]]
