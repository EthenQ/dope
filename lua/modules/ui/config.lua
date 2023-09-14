local config = {}

function config.zephyr()
  vim.cmd('colorscheme zephyr')
end

function config.dashboard()
  local db = require('dashboard')
  local home = os.getenv('HOME')
  db.setup({
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
      project = { enable = false },
      shortcut = {
        { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          desc = ' Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'i',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope find_files hidden=true search_dirs={"' .. home .. '/.dotfiles"}',
          key = 'd',
        },
      },
    },
  })
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      numbers = function(opts)
        return string.format('%s.)', opts.ordinal)
      end,
      always_show_bufferline = false,
    },
  })
end

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
  })
end

function config.galaxyline()
  require("galaxyline.themes.eviline")
end

return config
