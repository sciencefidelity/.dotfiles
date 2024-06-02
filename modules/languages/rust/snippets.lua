local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local conds_expand = require("luasnip.extras.conditions.expand")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("rust", {
  s("pl", fmt('println!("{}"{})', { i(1), i(0) })),
  s("pf", fmt('print!("{}"{})', { i(1), i(0) })),
  s("ep", fmt('eprintln!("{}"{})', { i(1), i(0) })),
  s("ase", fmt("assert_eq!({})", { i(0) })),
  s("as", fmt("assert!({})", { i(0) })),
  s("asn", fmt("assert_ne!({})", { i(0) })),
  s("der", fmt("#[derive({})]", { i(0) })),
  s("deg", fmt("#[derive(Debug{})]", { i(0) })),
  s(
    "dea",
    fmt("#[derive(Debug, Copy, Clone, Default, Eq, PartialEq, Ord, PartialOrd{})]", { i(1) }),
    { condition = conds_expand.line_begin }
  ),
  s("des", t("#[derive(Serialize, Deserialize)]")),
  s("re", fmt("Result<{}, {}>", { i(1), i(0) })),
  s("op", fmt("Option<{}>", { i(0) })),
  s("ok", fmt("Ok({})", { i(0) })),
  s("sm", fmt("Some({})", { i(0) })),
  s("er", fmt("Err({})", { i(0) })),
  s("any", fmt("anyhow!({})", { i(0) })),
  s("bail", fmt("anyhow::bail!({})", { i(0) })),
  s(
    "str",
    fmt(
      [[
struct {1} {{
    {2}
}}
]],
      { i(1), i(0) }
    )
  ),
  s("ste", fmt("struct {1};", { i(1) })),
  s(
    "imp",
    fmt(
      [[
impl {1} {{
    {2}
}}
]],
      { i(1), i(0) }
    )
  ),
  s(
    "fn",
    fmt(
      [[
pub fn {1}() -> {2} {{
    {3}
}}
]],
      { i(2), i(1), i(0) }
    )
  ),
  s(
    "enu",
    fmt(
      [[
enum {1} {{
    {2}
}}
]],
      { i(1), i(0) }
    )
  ),
  s(
    "mat",
    fmt(
      [[
match {1} {{
    {2}
}}
]],
      { i(1), i(0) }
    )
  ),
  s(
    "tes",
    fmt(
      [[
#[test]
fn test_{1}() {{
	{2}
}}
]],
      { i(1), i(0) }
    )
  ),
  s(
    "tm",
    fmt(
      [[
#[cfg(test)]
mod tests {{
	use super::*;
{1}
}}
]],
      { i(0) }
    )
  ),
  s(
    "bench",
    fmt(
      [[
#[bench]
fn bench_{1}() {{
	{2}
}}
]],
      { i(1), i(0) }
    )
  ),
})
