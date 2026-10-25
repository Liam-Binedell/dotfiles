return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          Snacks.dim.enable()
        end,
      })
    end,
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true, -- show dotfiles in fuzzy finder
            ignored = false, -- optional: show gitignored files
          },
        },
      },
    },
  },
}
