local Hydra = require "hydra"

local hint = [[
 Debug
 _t_: Debug Test
 _b_: Toggle breakpoint
 _c_: Continue
 _s_: Step over
 _S_: Step into
 _q_, <ESC>: Terminate and Quit
]]

Hydra {
  name = "Debug",
  hint = hint,
  config = {
    color = "pink",
    invoke_on_body = true,
    hint = {
      border = "rounded",
    },
    on_enter = function() vim.o.virtualedit = "all" end,
  },
  mode = "n",
  body = "<leader>d",
  heads = {
    { "t", "<CMD>GoDebug -t<CR>" },
    { "b", "<CMD>lua require'dap'.toggle_breakpoint()<CR>" },
    { "c", "<cmd>lua require'dap'.continue()<CR>" },
    { "s", "<cmd>lua require'dap'.step_over()<CR>" },
    { "S", "<cmd>lua require'dap'.step_into()<CR>" },
    { "q", "<cmd>lua require'dap'.terminate() <CR>", { exit = true } },
    { "<Esc>", "<cmd>lua require'dap'.terminate()<CR>", { exit = true } },
  },
}
