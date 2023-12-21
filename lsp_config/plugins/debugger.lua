local dap = require('dap')
local widgets = require('dap.ui.widgets')
local handle = io.popen("which python")
local python_path = handle:read("*a")
handle:close()
require('dap-python').setup(python_path)

vim.keymap.set('n', '<leader>dk', function() dap.continue() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>do', function() dap.step_over() end)
vim.keymap.set('n', '<leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dK', function() dap.restart() end)
vim.keymap.set('n', '<leader>dt', function() dap.terminate() end)

dap.defaults.fallback.terminal_win_cmd = 'tabnew'
vim.api.nvim_create_autocmd( "FileType", {
  pattern = "dap-float",
  callback = function() vim.keymap.set('n', 'q', ':q<CR>', {silent=true, buffer=true}) end,
})

local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    for _, keymap in pairs(keymaps) do
      if keymap.lhs == "K" then
        table.insert(keymap_restore, keymap)
        api.nvim_buf_del_keymap(buf, 'n', 'K')
      end
    end
  end
  vim.keymap.set({'n', 'v'}, '<Leader>df', function()
   widgets.centered_float(widgets.scopes)
  end)
  vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    widgets.hover()
  end)
end

dap.listeners.after['event_terminated']['me'] = function()
  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(
      keymap.buffer,
      keymap.mode,
      keymap.lhs,
      keymap.rhs,
      { silent = keymap.silent == 1 }
    )
  end
  keymap_restore = {}
end
