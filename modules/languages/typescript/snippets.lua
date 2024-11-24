local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
-- local conds_expand = require("luasnip.extras.conditions.expand")
local s = ls.snippet
-- local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("typescript", {
  s(
    "pl",
    [[
import type {{ PageLoad }} from './$types';

export const load: PageLoad = ({{ params }}) => {
  return {{

  }};
}};
]]
  ),
  s("ste", fmt("struct {1};", { i(1) })),
  s(
    "sl",
    [[
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ params }) => {
  return {

  };
};
]]
  ),
})
