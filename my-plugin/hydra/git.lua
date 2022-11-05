local Hydra = require "hydra"

local hint = [[
  Git
  _j_: Next git hunk
  _k_: Previous git hunk
  _l_: View git blame
  _p_: Preview git hunk
  _r_: Reset git hunk
  _R_: Reset git buffer
  _s_: Stage git hunk
  _S_: Unstage git hunk
  _d_: View git diff
  _q_, _<Esc>_: quit
]]

Hydra {
  name = "Git",
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
  body = "<leader>g",
  heads = {
    { "j", function() require("gitsigns").next_hunk() end, { desc = "Next git hunk" } },
    { "k", function() require("gitsigns").prev_hunk() end, { desc = "Previous git hunk" } },
    { "l", function() require("gitsigns").blame_line() end, { desc = "View git blame" } },
    { "p", function() require("gitsigns").preview_hunk() end, { desc = "Preview git hunk" } },
    { "r", function() require("gitsigns").reset_hunk() end, { desc = "Reset git hunk" } },
    { "R", function() require("gitsigns").reset_buffer() end, { desc = "Reset git buffer" } },
    { "s", function() require("gitsigns").stage_hunk() end, { desc = "Stage git hunk" } },
    { "S", function() require("gitsigns").undo_stage_hunk() end, { desc = "Unstage git hunk" } },
    { "d", function() require("gitsigns").diffthis() end, { desc = "View git diff" } },

    { "q", nil, { exit = true, desc = false } },
    { "<Esc>", nil, { exit = true, desc = false } },
  },
}
