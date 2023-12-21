local t = require('telescope')
local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local opts = { noremap = true, silent = true}

local function path_format(opts, path)  --  not used because we cannot set path_display for individual builtins opts, and we don't want to set it in global opts, since it would also apply to e.g. list_buffers  
  local separator = require('plenary.path').path.sep
  local last_sep_idx = 1
  local tail, relpath = "", ""
  if string.find(path,separator) == nil then
    tail = path
    relpath = "."
  else
    for i=1,string.len(path) do
      r = string.find(path,separator,i)
      if r == nil then break end
      last_sep_idx = r
    end
    tail = path:sub(last_sep_idx+1,string.len(path))
    relpath = path:sub(1,last_sep_idx-1)
    relpath = string.len(relpath)==0 and "." or relpath
  end
  local fpath = string.format("%s  --  %s", tail, relpath)
  return fpath
end

t.setup({
  pickers = {
    find_files = { theme = "dropdown" },
    live_grep = { theme = "dropdown" },
    help_tags = { theme = "dropdown" },
    oldfiles = { theme = "dropdown" },
    buffers = {
      mappings = {
        n = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        },
        i = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      },
      theme = "dropdown",
    }
  },
  defaults = {
    mappings = {
      n = {
        ["<C-p>"] = action_layout.toggle_preview,
        ["q"] = actions.close,
      },
      i = {
        ["<C-p>"] = action_layout.toggle_preview,
      },
    },
    path_display = { "smart" }
  },
  extensions = {
    fzf = {
      fuzzy = false,                   -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- "smart_case" (def) or "ignore_case" or "respect_case"
    }
  }
})

t.load_extension('dap')
t.load_extension('fzf')

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, opts)

vim.keymap.set('n', '<leader>dc', t.extensions.dap.commands, opts)
vim.keymap.set('n', '<leader>db', t.extensions.dap.list_breakpoints, opts)
vim.keymap.set('n', '<leader>dr', t.extensions.dap.frames, opts)
