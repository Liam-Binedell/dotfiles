return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
      },
      keymap = {
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["S-<Tab>"] = { "select_prev", "fallback" },
      },
    },
  },
}
