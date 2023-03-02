local config = {}
local home = os.getenv("HOME")

local format = require('modules.completion.format')
local api = vim.api
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local enhance_attach = function(client,bufnr)
  if client.server_capabilities.document_formatting then
    format.lsp_before_save()
  end
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end
-- config server in this function
function config.nvim_lsp()
  require('lspconfig').prosemd_lsp.setup{}
  require('lspconfig').dockerls.setup{}
  require('lspconfig').bashls.setup{}
  require('lspconfig').lua_ls.setup{
    cmd = {
      home.."/Workspace/lua-language-server/bin/lua-language-server",
      "-E",
      home.."/Workspace/lua-language-server/main.lua"
    };
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {"vim","packer_plugins"}
        },
        runtime = {version = "LuaJIT"},
        workspace = {
          library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
        },
      },
    }
  }
  require('lspconfig').gopls.setup{
    cmd = {
      'gopls', -- share the gopls instance if there is one already
      '-remote=auto', --[[ debug options ]] --
      "-logfile=auto",
      "-debug=:0",
      '-remote.debug=:0',
      "-rpc.trace",
    },
    on_attach = enhance_attach,
    capabilities = capabilities,
    init_options = {
      usePlaceholders=true,
      completeUnimported=true,
    }
  }
end

function config.nvim_cmp()
  local cmp = require('cmp')

  cmp.setup({
		preselect = cmp.PreselectMode.Item,
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		formatting = {
      fields = {'kind', 'abbr', 'menu'},
			format = function(entry, vim_item)
				local lspkind_icons = {
					Text = "",
					Method = "",
					Function = "",
					Constructor = " ",
					Field = "",
					Variable = "",
					Class = "",
					Interface = "",
					Module = "硫",
					Property = "",
					Unit = " ",
					Value = "",
					Enum = " ",
					Keyword = "ﱃ",
					Snippet = " ",
					Color = " ",
					File = " ",
					Reference = "Ꮢ",
					Folder = " ",
					EnumMember = " ",
					Constant = " ",
					Struct = " ",
					Event = "",
					Operator = "",
					TypeParameter = " ",
				}
        local meta_type = vim_item.kind
				-- load lspkind icons
				vim_item.kind = lspkind_icons[vim_item.kind]..''

				vim_item.menu = ({
					buffer = " Buffer",
					nvim_lsp = meta_type,
					path = " Path",
					luasnip = " LuaSnip"
				})[entry.source.name]

				return vim_item
			end,
		},
		-- You can set mappings if you want
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.close(),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
			},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
			},
  })
end

function config.lua_snip()
  local ls = require('luasnip')
  local types = require('luasnip.util.types')
  ls.config.set_config({
    history = true,
    enable_autosnippets = true,
    updateevents = 'TextChanged,TextChangedI',
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { '<- choiceNode', 'Comment' } },
        },
      },
    },
  })
  require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.auto_pairs()
  require("nvim-autopairs").setup({})
  local cmp = require('cmp')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
end

return config
