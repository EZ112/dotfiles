local map = vim.keymap.set

local dropbar_api = require('dropbar.api')
local telescope_builtin = require('telescope.builtin')
local code_action = require('tiny-code-action').code_action
local gitsigns = require('gitsigns')
local harpoon = require('harpoon')

---@param dir "next" | "prev"
local nav_hunk = function(dir)
  return function()
    if vim.wo.diff then
      vim.cmd.normal({ dir == 'next' and ']c' or '[c', bang = true })
    else
      gitsigns.nav_hunk(dir, { target = 'all' })
    end
  end
end

harpoon:setup()
local harpoon_list = harpoon:list()
---@param method "add" | "next" | "prev"
local harpoon_dispatch = function(method)
  return function()
    harpoon_list[method](harpoon_list)
  end
end

local harpoon_menu = function()
  harpoon.ui:toggle_quick_menu(harpoon_list)
end

local mappings = {
  -- navigation
  { 'n', '<C-h>', '<C-w>h', { desc = 'switch window left' } },
  { 'n', '<C-l>', '<C-w>l', { desc = 'switch window right' } },
  { 'n', '<C-j>', '<C-w>j', { desc = 'switch window down' } },
  { 'n', '<C-k>', '<C-w>k', { desc = 'switch window up' } },

  { 'n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' } },

  -- line number
  { 'n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'toggle line number' } },
  { 'n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'toggle relative number' } },

  -- comment
  { 'n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true } },
  { 'v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true } },

  -- oil
  { 'n', '<C-n>', '<CMD>Oil<CR>', { desc = 'Open directory' } },

  -- dropbar
  { 'n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' } },

  -- telescope
  { 'n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' } },
  { 'n', '<leader>fw', telescope_builtin.live_grep, { desc = 'Telescope live grep' } },
  { 'n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' } },
  { 'n', '<leader>gt', telescope_builtin.git_status, { desc = 'Telescope git status' } },
  { 'n', '<leader>gm', telescope_builtin.git_commits, { desc = 'Telescope git commits' } },
  { 'n', '<leader>gbr', telescope_builtin.git_branches, { desc = 'Telescope git branches' } },
  { 'n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' } },

  -- auto session
  { 'n', '<leader>sd', '<cmd>AutoSession deletePicker<CR>', { desc = 'Session delete picker' } },

  -- code action
  { 'n', '<leader>ca', code_action, { desc = 'Code Action', noremap = true, silent = true } },

  -- gitsigns
  { 'n', ']c', nav_hunk('next'), { desc = 'Next hunk' } },
  { 'n', '[c', nav_hunk('prev'), { desc = 'Prev hunk' } },
  { 'n', '<leader>gbm', gitsigns.blame, { desc = 'Git blame' } },
  { 'n', '<leader>gd', gitsigns.diffthis, { desc = 'Git diff' } },
  { 'n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git stage hunk' } },
  { 'n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Git undo stage hunk' } },
  { 'n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git reset hunk' } },
  { 'n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Git preview hunk inline' } },

  -- flash
  { { 'n', 'x', 'o' }, 's', require('flash').jump, { desc = 'Flash' } },
  { { 'n', 'x', 'o' }, 'S', require('flash').treesitter, { desc = 'Flash Treesitter' } },
  { 'o', 'r', require('flash').remote, { desc = 'Remote Flash' } },
  { { 'o', 'x' }, 'R', require('flash').treesitter_search, { desc = 'Treesitter Search' } },
  { 'c', '<c-s>', require('flash').toggle, { desc = 'Toggle Flash Search' } },

  -- harpoon
  { 'n', '<C-e>', harpoon_menu, { desc = 'Harpoon list' } },
  { 'n', '<leader>a', harpoon_dispatch('add'), { desc = 'Harpoon add' } },
  { 'n', '<C-j>', harpoon_dispatch('next'), { desc = 'Harpoon next item' } },
  { 'n', '<C-k>', harpoon_dispatch('prev'), { desc = 'Harpoon prev item' } },

  -- lsp
  { 'n', 'gd', vim.lsp.buf.definition, { desc = 'LSP go to definition' } },

  -- dadbod
  { 'n', '<leader>du', '<cmd>DBUIToggle<cr>', { desc = 'Toggle Dadbod UI' } },
  { 'n', '<leader>dl', '<cmd>DBUIFindBuffer<cr>', { desc = 'Find Last DB Buffer' } },

  -- wayfinder
  { 'n', '<leader>w', '<cmd>Wayfinder<cr>', { desc = 'Wayfinder' } },
}

for _, m in ipairs(mappings) do
  map(unpack(m))
end
