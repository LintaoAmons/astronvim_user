local cmp = require "cmp"

return function(config)
  config.mapping["<CR>"] = cmp.mapping.confirm { select = true }
  config.formatting.fields = { "abbr", "kind" }
  return config
end
