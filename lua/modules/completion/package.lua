local package = require('core.pack').package
local conf = require('modules.completion.config')

package({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  --
  ft = { 'bufls', 'go', 'sh', 'lua', 'rust', 'c', 'cpp', 'dockerfile', 'markdown', 'yaml', 'helm', 'json', 'jsonc',
    'groovy',
    "yaml.asnsible" },
  config = conf.nvim_lsp,
})

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
  },
})

package({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })

package({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })

package({
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
})

package({
  'ray-x/navigator.lua',
  dependencies = {
    { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    require('navigator').setup()
  end
})

package({ 'towolf/vim-helm' })

package({ 'lukas-reineke/lsp-format.nvim' })

-- package({
--   "zbirenbaum/copilot.lua",
--   config = function()
--     require("copilot").setup({})
--   end,
-- })
package({ 'codota/tabnine-nvim', build = ":! ./dl_binaries.sh" })
--package({ 'github/copilot.vim' })
