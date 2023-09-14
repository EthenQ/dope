local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k',    cmd('bdelete'),                opts(noremap, silent) },
  -- save
  { '<C-s>',     cmd('write'),                  opts(noremap) },
  -- yank
  { 'Y',         'y$',                          opts(noremap) },
  -- buffer jump
  { ']b',        cmd('bn'),                     opts(noremap) },
  { '[b',        cmd('bp'),                     opts(noremap) },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- window jump
  { '<C-h>',     '<C-w>h',                      opts(noremap) },
  { '<C-l>',     '<C-w>l',                      opts(noremap) },
  { '<C-j>',     '<C-w>j',                      opts(noremap) },
  { '<C-k>',     '<C-w>k',                      opts(noremap) },
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>',       opts(noremap) },
  { '<C-e>', '<End>',      opts(noremap) },
  { '<C-s>', '<Esc>:w<CR>' },
  { '<C-a>', '<Esc>^i' },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })
-- usage of plugins
nmap({
  -- plugin manager: Lazy.nvim
  { '<Leader>pu', cmd('Lazy update'), opts(
    noremap, silent) },
  { '<Leader>pi', cmd('Lazy install'), opts(
    noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(
    noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(
    noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(
    noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(
    noremap, silent) },
  -- Telescope
  { '<Leader>b', cmd('Telescope buffers'), opts(
    noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(
    noremap, silent) },
  { '<Leader>fi', cmd('Telescope find_files'), opts(
    noremap, silent) },
  -- BufferLine
  { '<Leader>1', cmd('BufferLineGoToBuffer 1'), opts(
    noremap, silent) },
  { '<Leader>2', cmd('BufferLineGoToBuffer 2'), opts(
    noremap, silent) },
  { '<Leader>3', cmd('BufferLineGoToBuffer 3'), opts(
    noremap, silent) },
  { '<Leader>4', cmd('BufferLineGoToBuffer 4'), opts(
    noremap, silent) },
  { '<Leader>5', cmd('BufferLineGoToBuffer 5'), opts(
    noremap, silent) },
  { '<Leader>6', cmd('BufferLineGoToBuffer 6'), opts(
    noremap, silent) },
  { '<Leader>7', cmd('BufferLineGoToBuffer 7'), opts(
    noremap, silent) },
  { '<Leader>8', cmd('BufferLineGoToBuffer 8'), opts(
    noremap, silent) },
  { '<Leader>9', cmd('BufferLineGoToBuffer 9'), opts(
    noremap, silent) },
  --dap
  { '<F4>', cmd(":lua require('dapui').toggle()<CR>"), opts(
    noremap) },
  { "<Leader>di", cmd(":lua require('dapui').toggle()<CR>"), opts(
    noremap, silent) },
  { "<F5>", cmd(":lua require('dap').toggle_breakpoint()<CR>"), opts(
    noremap, silent) },
  { "<Leader>dbt", cmd(":lua require('dap').toggle_breakpoint()<CR>"), opts(
    noremap, silent) },
  { "<F9>", cmd(":lua require('dap').continue()<CR>"), opts(
    noremap, silent) },
  { "<Leader>dsc", cmd(":lua require('dap').continue()<CR>"), opts(
    noremap, silent) },
  { "<F1>", cmd(":lua require('dap').step_over()<CR>"), opts(
    noremap, silent) },
  { "<Leader>dsv", cmd(":lua require('dap').step_over()<CR>"), opts(
    noremap, silent) },
  { "<F2>", cmd(":lua require('dap').step_into()<CR>"), opts(
    noremap, silent) },
  { "<Leader>dsi", cmd(":lua require('dap').step_into()<CR>"), opts(
    noremap, silent) },
  { "<F3>", cmd(":lua require('dap').step_out()<CR>"), opts(
    noremap, silent) },
  { "<Leader>dso", cmd(":lua require('dap').step_out()<CR>"), opts(
    noremap, silent) },
  { "<Leader>dhh", cmd(":lua require('dap.ui.variables').hover()<CR>"), opts(
    noremap, silent) },
  { "<Leader>duh", cmd(":lua require('dap.ui.widgets').hover()<CR>"), opts(
    noremap, silent) },
  { "<Leader>duf", cmd(":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>"),
    opts(
      noremap, silent) },
  { "<Leader>dro", cmd(":lua require('dap').repl.open()<CR>"), opts(
    noremap, silent) },
  { "<Leader>drl", cmd(":lua require('dap').repl.run_last()<CR>"), opts(
    noremap, silent) },
  { "<Leader>dbc", cmd(":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"),
    opts(
      noremap, silent) },
  { "<Leader>dbm",
    cmd(
      ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ')), opts(noremap,silent)})<CR>"),
    opts(
      noremap, silent) },
  { "<Leader>dc", cmd(":lua require('dap.ui.variables').scopes()<CR>"), opts(
    noremap, silent) },
})
--dap
vmap(
  { "<Leader>dhv", cmd(":lua require('dap.ui.variables').visual_hover()<CR>"), opts(noremap) }
)
