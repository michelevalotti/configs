require('mini.sessions').setup({
  -- Whether to read latest session if Neovim opened without file arguments
  autoread = false,
  -- Whether to write current session before quitting Neovim
  autowrite = true,
  -- Directory where global sessions are stored (use `''` to disable)
  directory =  '~/.config/nvim/sessions',
  -- File for local session (use `''` to disable)
  file = 'Session.vim',
})


local header_art = 
[[
 ╭───╮   ╭┬────╮╭─────╮┬     ┬┬╭──┬──╮
 │   │   ││     │     ││     │││  │  │
 │   │   ││     │     │╰┐   ┌╯││  │  │
 │   │   │├──┤  │     │ │   │ ││  │  │
 │   │   ││     │     │ ╰┐ ┌╯ ││  │  │
 │   │   ││     │     │  │ │  ││     │
 ╯   ╰───╯╰────╯╰─────╯  ╰─╯  ┴┴     ┴
]]  -- it looks wonky here but renders perfectly on the splashscreen
require('mini.starter').setup({
  header = header_art,
})
