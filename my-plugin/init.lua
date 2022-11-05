local actions = require "telescope.actions"

local M = {
  init = {
    -- ❌ Disable default
    ["goolord/alpha-nvim"] = { disable = true },

    -- 👻 Add by me
    ["melkster/modicator.nvim"] = {
      config = function() require("modicator").setup() end,
    },
    {
      "LintaoAmons/scratch.nvim",
      -- branch = "create-user-commands-and-refactor",
      -- tag = "v0.3.1",
    },
    { "folke/neodev.nvim" },
    { "djoshea/vim-autoread" },
    { "nagy135/typebreak.nvim", requires = "nvim-lua/plenary.nvim" },
    { "ggandor/leap.nvim" },
    {
      "michaelb/sniprun",
      run = "bash ./install.sh",
      config = function()
        require("sniprun").setup {
          live_mode_toggle = "enable",
          display = {
            "Terminal",
          },
        }
      end,
    },
    { "phelipetls/jsonpath.nvim" },
    {
      "smjonas/inc-rename.nvim",
      config = function() require("inc_rename").setup() end,
    },
    {
      "smjonas/live-command.nvim",
      -- live-command supports semantic versioning via tags
      tag = "1.*",
      config = function()
        require("live-command").setup {
          commands = {
            Norm = { cmd = "norm" },
          },
        }
      end,
    },
    ["m-demare/hlargs.nvim"] = {
      config = function() require("hlargs").setup() end,
    },
    ["gennaro-tedesco/nvim-jqx"] = {},
    {
      "delphinus/auto-cursorline.nvim",
      config = function() require("auto-cursorline").setup {} end,
    },
    ["sindrets/diffview.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      config = function() require "user.my-plugin.diffview" end,
    },
    ["ray-x/go.nvim"] = {
      config = function() require "user.my-plugin.go" end,
    },
    ["ray-x/guihua.lua"] = {},
    ["nvim-zh/auto-save.nvim"] = {},
    ["kylechui/nvim-surround"] = {
      config = function() require("nvim-surround").setup {} end,
    },
    ["stevearc/dressing.nvim"] = {},

    ["kevinhwang91/nvim-ufo"] = {
      requires = "kevinhwang91/promise-async",
      config = function() require "user.my-plugin.nvim-ufo" end,
    },

    ["glepnir/lspsaga.nvim"] = {
      branch = "main",
    },

    ["sindrets/winshift.nvim"] = {},
    ["anuvyklack/hydra.nvim"] = {
      config = function() require "user.my-plugin.hydra" end,
    },

    ["jbyuki/venn.nvim"] = {},

    ["ray-x/lsp_signature.nvim"] = {},

    ["ziontee113/icon-picker.nvim"] = {
      config = function()
        require("icon-picker").setup {
          disable_legacy_commands = true,
        }
      end,
    },
    -- Dap
    ["mfussenegger/nvim-dap"] = {
      -- config = function() end,
    },
    -- ["ravenxrz/DAPInstall.nvim"] = {},
    ["theHamsta/nvim-dap-virtual-text"] = {
      -- config = function() require("nvim-dap-virtual-text").setup() end,
    },
    ["rcarriga/nvim-dap-ui"] = {
      -- config = function() require "user.my-plugin.dap.ui" end,
    },
    ["nvim-telescope/telescope-dap.nvim"] = {},
    -- ["ii14/emmylua-nvim"] = {},
    -- ["ckipp01/nvim-jenkinsfile-linter"] = { requires = { "nvim-lua/plenary.nvim" } },
    -- ["nvim-treesitter/nvim-treesitter-context"] = {},
    ["nvim-treesitter/playground"] = {},
  },

  -- Overrides default config
  ["lspkind"] = require "user.my-plugin.lspkind",
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup functino call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
    }
    -- set up null-ls's on_attach function
    -- NOTE: You can remove this on attach function to disable format on save
    --[[ config.on_attach = function(client) ]]
    --[[   if client.resolved_capabilities.document_formatting then ]]
    --[[     vim.api.nvim_create_autocmd("BufWritePre", { ]]
    --[[       desc = "Auto format before save", ]]
    --[[       pattern = "<buffer>", ]]
    --[[       callback = vim.lsp.buf.formatting_sync, ]]
    --[[     }) ]]
    --[[   end ]]
    --[[ end ]]
    return config -- return final config table to use in require("null-ls").setup(config)
  end,
  treesitter = require "user.my-plugin.treesitter",
  -- use mason-lspconfig to configure LSP installations
  ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    ensure_installed = { "sumneko_lua" },
  },
  -- use mason-tool-installer to configure DAP/Formatters/Linter installation
  ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
    ensure_installed = { "prettier", "stylua" },
  },
  ["telescope"] = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
    },
  },
  ["aerial"] = {
    keymaps = {
      ["O"] = "actions.tree_open_all",
      ["X"] = "actions.tree_close_all",
      ["o"] = "actions.jump",
    },
  },

  ["cmp"] = require "user.my-plugin.cmp",

  ["neo-tree"] = require "user.my-plugin.neo-tree",

  packer = { -- overrides `require("packer").setup(...)`
    compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
  },
}

return M
