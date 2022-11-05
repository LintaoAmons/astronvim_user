function _G.compare_to_clipboard()
  local ftype = vim.api.nvim_eval "&filetype"
  vim.cmd "vsplit"
  vim.cmd "enew"
  vim.cmd "normal! P"
  vim.cmd "setlocal buftype=nowrite"
  vim.cmd("set filetype=" .. ftype)
  vim.cmd "diffthis"
  vim.cmd [[execute "normal! \<C-w>h"]]
  vim.cmd "diffthis"
end

return function()
  -- Set key binding
  -- Set autocommands
  vim.api.nvim_create_augroup("packer_conf", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Sync packer after modifying plugins.lua",
    group = "packer_conf",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
  })

  vim.keymap.set("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand "<cword>" end, { expr = true })

  require("auto-save").on()
  require "user.my-plugin.dap.go"
  require("sniprun").setup {
    display = { "Terminal" },
  }

  require("scratch").setup {
    filetypes = { "json", "xml", "go", "lua", "js", "py", "sh", "md", "txt" },
  }
  vim.keymap.set("n", "<M-C-n>", "<cmd>Scratch<cr>")
  vim.keymap.set("n", "<M-C-o>", "<cmd>ScratchOpen<cr>")
end
