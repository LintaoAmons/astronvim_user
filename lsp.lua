-- Extend LSP configuration
return {
  -- enable servers that you already have installed without mason
  formatting = {
    format_on_save = false,
  },
  servers = {
    -- "pyright"
  },
  -- easily add or disable built in mappings added during LSP attaching
  mappings = {
    n = {
      ["<leader>lf"] = false, -- disable formatting keymap
      ["gr"] = false,
      ["gd"] = false,
    },
  },
  -- add to the global LSP on_attach function
  -- override the mason server-registration function
  -- server_registration = function(server, opts)
  --   require("lspconfig")[server].setup(opts)
  -- end,

  -- Add overrides for LSP server settings, the keys are the name of the server
  ["server-settings"] = {
    -- example for addings schemas to yamlls
    -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
    --   settings = {
    --     yaml = {
    --       schemas = {
    --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
    --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
    --       },
    --     },
    --   },
    -- },
    -- Example disabling formatting for a specific language server
    -- gopls = { -- override table for require("lspconfig").gopls.setup({...})
    --   on_attach = function(client, bufnr)
    --     client.resolved_capabilities.document_formatting = false
    --   end
    -- }
    ["emmet-ls"] = {
      filetypes = {
        -- "css",
        "django-html",
        "ejs",
        "handlebars",
        "hbs",
        "html",
        "htmldjango",
        "javascriptreact",
        "less",
        "pug",
        "sass",
        "scss",
        "typescriptreact",
      },
      init_options = {
        html = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          options = {
            ["output.selfClosingStyle"] = "xhtml", -- Style of self-closing tags: html (`<br>`), xml (`<br/>`) or xhtml (`<br />`)
            ["jsx.enabled"] = true, -- Enable/disable JSX addon
          },
        },
      },
    },
  },
}
