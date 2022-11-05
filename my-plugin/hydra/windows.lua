local Hydra = require "hydra"
local splits = require "smart-splits"

local cmd = require("hydra.keymap-util").cmd
local pcmd = require("hydra.keymap-util").pcmd

local window_hint = [[
     Move      ^^    Size   ^^   ^^     Split
-------------  ^^-----------^^   ^^---------------
 ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _t_: Toggle Autowidth 
 _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _c_: close
 ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _=_: equalize
 ^ ^ ^ ^ ^ ^   ^^ ^          ^   _q_, _<Esc>_: quit
]]

Hydra {
  name = "Windows",
  hint = window_hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = "rounded",
      offset = -1,
    },
  },
  mode = "n",
  body = "<C-e>",
  heads = {
    { "H", cmd "WinShift left" },
    { "J", cmd "WinShift down" },
    { "K", cmd "WinShift up" },
    { "L", cmd "WinShift right" },

    { "<C-h>", function() splits.resize_left(2) end },
    { "<C-j>", function() splits.resize_down(2) end },
    { "<C-k>", function() splits.resize_up(2) end },
    { "<C-l>", function() splits.resize_right(2) end },
    { "=", "<C-w>=", { desc = "equalize" } },

    {
      "t",
      function()
        cmd "<cmd>WindowsToggleAutowidth<cr>"
        vim.notify "Autowidth toggle triggered"
      end,
      { desc = "Toggle Autowidth" },
    },

    { "c", pcmd("close", "E444"), { desc = "close window" } },
    { "<C-c>", pcmd("close", "E444"), { desc = false } },
    { "<C-q>", pcmd("close", "E444"), { desc = false } },

    { "q", nil, { exit = true, desc = false } },
    { "<Esc>", nil, { exit = true, desc = false } },
  },
}
