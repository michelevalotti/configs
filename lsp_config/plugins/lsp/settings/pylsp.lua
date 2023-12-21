return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false
        },
        pyflakes = {
          enabled = true
        },
        pylint = {
          enabled = false
        },
        flake8 = {
          enabled = false
        },
        jedi_complete = {
          fuzzy = true
        }
      }
    }
  }
}
