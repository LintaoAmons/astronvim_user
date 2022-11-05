local function closeWindowOrBuffer()
  local isOk, _ = pcall(vim.cmd, "close")

  if not isOk then vim.cmd "bd" end
end

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<M-w>"] = { function() closeWindowOrBuffer() end, desc = "Close current window/split" },
    ["<M-q>"] = { "<cmd>qa!<CR>", desc = "quit nvim" },

    -- Tab
    ["tx"] = { "<cmd>tabclose<cr>", desc = "close current tab" },
    ["tn"] = { "<cmd>tabnew<cr>", desc = "new tab" },
    ["tl"] = { "<cmd> tabnext <CR>", desc = "Tab Next" },
    ["th"] = { "<cmd> tabprevious <CR>", desc = "Tab Previous" },

    ["<leader>df"] = { "<cmd> DiffviewOpen <cr>", desc = "Open diffview" },
    ["<leader>dd"] = { "<cmd> DiffviewFileHistory %<cr>", desc = "diff current file" },
    ["<leader>dv"] = { ":call v:lua.compare_to_clipboard()<CR>", desc = "Diff selected with clipboard" },

    ["<leader>wl"] = { "<cmd>vsplit<cr>", desc = "Split window vertically" },
    ["<leader>wo"] = { "<c-w>o", desc = "Maximize window" },
    ["<leader>wc"] = { "<c-w>c", desc = "Close window" },

    ["<leader>fm"] = { "<cmd>lua vim.lsp.buf.format { async = true } <cr>", desc = "Format" },

    ["s"] = {
      function()
        require("leap").leap {
          target_windows = vim.tbl_filter(
            function(win) return vim.api.nvim_win_get_config(win).focusable end,
            vim.api.nvim_tabpage_list_wins(0)
          ),
        }
      end,
    },

    -- find
    ["<leader>fe"] = { "<cmd>Neotree buffers <cr>", desc = "Find Recent files" },
    ["<leader>fl"] = { "<cmd>Neotree reveal<cr>", desc = "Reveal current file in file tree" },
    ["<leader>fE"] = { "<cmd>Telescope oldfiles<cr>", desc = "Find Recent files" },
    ["<leader>fd"] = {
      ':lua require("dir-telescope.features.find-in-dir").FileInDirectory({}) <CR>',
      desc = "Find in Directory",
    },
    ["<leader>gd"] = {
      ':lua require("dir-telescope.features.grep-in-dir").GrepInDirectory({}) <CR>',
      desc = "Grep in Directory",
    },
    ["<M-e>"] = { "<cmd>Telescope oldfiles<cr>", desc = "Find Recent files" },
    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", desc = "Find commands/keymaps" }, -- keymap is more like commands for me

    ["ge"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", desc = "Go to next diagnostic/error" },
    ["gr"] = { "<CMD>lua require'telescope.builtin'.lsp_references{}<CR>", desc = "Go to references" },
    ["gd"] = { "<CMD>Telescope lsp_definitions<CR>", desc = "Go to definitions" },
    ["gt"] = { "<CMD>GoAlt<CR>", desc = "Go to tests" },
    ["K"] = { "<CMD>Lspsaga hover_doc<CR>", desc = "Hover_Doc" },
    ["<M-k>"] = { "<CMD>Lspsaga code_action<CR>", desc = "Code Action" },
    ["<leader>lf"] = { "<CMD>Lspsaga lsp_finder<CR>", desc = "Lsp finder" },
    ["gl"] = { "<CMD>Lspsaga lsp_finder<CR>", desc = "Lsp finder" },
    ["<M-l>"] = { "<CMD>Lspsaga lsp_finder<CR>", desc = "Lsp finder" },

    -- ["<leader>rn"] = { function() return ":IncRename " .. vim.fn.expand "<cword>" end, desc = "Rename" },
    ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },

    -- Run
    ["<leader>rr"] = { "<cmd>GoTestFile<cr>", desc = "GoTestFile" },
    ["<leader>rt"] = { "<cmd>GoTest<cr>", desc = "RunAllGoTest: GoTestFile" },
    ["<leader>rl"] = { "<cmd>luafile %<cr>", desc = "Source current lua file" },
    ["<M-r>"] = { ":%SnipRun<CR>", desc = "Run current file" },

    ["<leader>zo"] = { "zR", desc = "Unfold all" },
    ["<leader>zc"] = { "zM", desc = "Fold all" },

    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", desc = "Find files" },

    -- tree
    ["<C-n>"] = { "<cmd> Neotree toggle <CR>", desc = "toggle nvimtree" },
    ["<leader>e"] = { "<cmd> Neotree focus <CR>", desc = "focus nvimtree" },

    -- No
    ["<leader>nl"] = { "<cmd> nohl <CR>", desc = "nohl" },

    -- Show
    ["<leader>ss"] = { "<cmd>AerialToggle<CR>", desc = "Show outline" },
    ["<leader>sg"] = { "<cmd>Neotree git_status<cr>", desc = "Show git status" },

    ["<C-q>"] = { "<cmd>SessionManager load_session<CR>", desc = "Load session" }, -- <!>load_session
    ["<C-M-p>"] = { "<cmd>Telescope commands<CR>", desc = "Find commands" },

    -- Test KeyStroke
    ["<C-M-m>"] = { '<cmd>lua vim.notify("heihei")<CR>' }, -- command+control+m
    ["<M-m>"] = { '<cmd>lua vim.notify("haha")<CR>' }, -- command+m
    ["<M-I>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }, -- alt + shift + i --> tab + i --> by karabiner
    ["<C-I>"] = { '<cmd>lua vim.notify("C-I")<CR>' },

    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

    -- ["<leader>db"] = {
    --   "<cmd>lua require'dap'.toggle_breakpoint(); require'user.dap.dap-util'.store_breakpoints(true)<cr>",
    -- },
    -- ["<leader>dt"] = {"<CMD>GoDebug -t<CR>"},
    -- ["<M-F8>"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>" }, -- command+f8
    -- ["<F4>"] = { "<cmd>lua require'dap'.terminate()<CR>" },
    -- ["<F9>"] = { "<cmd>lua require'dap'.continue()<CR>" },
    -- ["<F7>"] = { "<cmd>lua require'dap'.step_into()<CR>" },
    -- ["<F8>"] = { "<cmd>lua require'dap'.step_over()<CR>" },
  },
  i = {
    ["<C-q>"] = { "<cmd>SessionManager load_session<CR>", desc = "Load session" }, -- <!>load_session
    ["<M-P>"] = { "<cmd>Telescope commands<CR>", desc = "Find commands" },

    [";;"] = { " := ", desc = "golang: assign value" },
    [";a"] = { " != ", desc = "!=" },
    [";s"] = { " += ", desc = "+=" },
    [";d"] = { " == ", desc = "==" },
  },
  v = {
    ["<leader>dd"] = { "<cmd> DiffviewFileHistory<cr>", desc = "Diff file history" },
    ["<M-r>"] = { "<Plug>SnipRun" },
    ["<M-k>"] = { "<CMD>Lspsaga code_action<CR>", desc = "Code Action" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
