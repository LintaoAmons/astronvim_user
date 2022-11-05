local luasnip_avail, luasnip = pcall(require, "luasnip")
if not luasnip_avail then
  vim.notify "Load luasnip failed"
  return
end

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("all", {
  s("ternary", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:eluasnipe}"
    i(1, "cond"),
    t " ? ",
    i(2, "then"),
    t " : ",
    i(3, "eluasnipe"),
  }),
})
