local keymap = require('core.keymap')
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
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
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
  -- yank
  { 'Y', 'y$', opts(noremap) },
  -- buffer jump
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- window jump
  { '<C-h>', '<C-w>h', opts(noremap) },
  { '<C-l>', '<C-w>l', opts(noremap) },
  { '<C-j>', '<C-w>j', opts(noremap) },
  { '<C-k>', '<C-w>k', opts(noremap) },
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
  { '<C-s>', '<Esc>:w<CR>' },
  { '<C-a>', '<Esc>^i' },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })
-- usage of plugins
nmap({
  -- plugin manager: Lazy.nvim
  { '<Leader>pu', cmd('Lazy update'), opts(noremap, silent) },
  { '<Leader>pi', cmd('Lazy install'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>fi', cmd('Telescope find_files'), opts(noremap, silent) },
  -- BufferLine
  { '<Leader>1', cmd('BufferLineGoToBuffer 1'), opts(noremap, nowait, slient) },
  { '<Leader>2', cmd('BufferLineGoToBuffer 2'), opts(noremap, nowait, slient) },
  { '<Leader>3', cmd('BufferLineGoToBuffer 3'), opts(noremap, nowait, slient) },
  { '<Leader>4', cmd('BufferLineGoToBuffer 4'), opts(noremap, nowait, slient) },
  { '<Leader>5', cmd('BufferLineGoToBuffer 5'), opts(noremap, nowait, slient) },
  { '<Leader>6', cmd('BufferLineGoToBuffer 6'), opts(noremap, nowait, slient) },
  { '<Leader>7', cmd('BufferLineGoToBuffer 7'), opts(noremap, nowait, slient) },
  { '<Leader>8', cmd('BufferLineGoToBuffer 8'), opts(noremap, nowait, slient) },
  { '<Leader>9', cmd('BufferLineGoToBuffer 9'), opts(noremap, nowait, slient) },
})
