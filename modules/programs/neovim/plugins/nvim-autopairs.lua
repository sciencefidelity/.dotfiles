local Rule = require("nvim-autopairs.rule")
local cond = require('nvim-autopairs.conds')
local npairs = require("nvim-autopairs")

npairs.setup({})

npairs.add_rules({
    Rule("<", ">", { "kotlin", "rust", "typescript" })
      :with_pair(cond.not_after_text(">"))
      :with_move(cond.after_text(">"))
})
