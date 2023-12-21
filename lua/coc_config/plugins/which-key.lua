local wk = require("which-key")
wk.register({
  f = {
    f = { "Find File" },
    b = { "Find Buffer" },
    h = { "Find Help Tag" },
    g = { "Find Grep" },
    o = { "Find Recent File" },
  },
  ["b"] = { "Toggle Breakpoint" },
  d = {
    k = { "Debugger Continue" },
    K = { "Debugger Restart" },
    l = { "Debugger Run Last Session" },
    o = { "Debugger Step Over" },
    i = { "Debugger Step Into" },
    t = { "Debugger Terminate" },
    f = { "Debugger Open Floating Window" },
    h = { "Debugger Open Hover Window" },
    b = { "Find Debugger Breakpoints" },
    r = { "Find Debugger Frames" },
    c = { "Find Debugger Commands" },
  }
}, { prefix = "<leader>"})
wk.register({
  c = {
    v = { "Change Terminal direction to Vertical" },
    h = { "Change Terminal direction to Horizontal" },
    f = { "Change Terminal direction to Float" },
  },
  t = {
    s = { "Show list of opened Terminals" },
  },
}, { prefix = "\\"})
wk.register({
  ["<C-h>"] = { "Move window focus left" },
  ["<C-j>"] = { "Move window focus down" },
  ["<C-k>"] = { "Move window focus up" },
  ["<C-l>"] = { "Move window focus right" },
  ["<S-h>"] = { "Move to prev buffer" },
  ["<S-l>"] = { "Move to next buffer" },
  ["K"] = { "show docs" },
})
