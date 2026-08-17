return {
  -- Jupytext integration for .ipynb files
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    lazy = false, -- Recommended to prevent JSON viewing issues on startup
  },

  -- Molten for running code cells
  {
    "benlubas/molten-nvim",
    version = "^v1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      -- Configure Molten global defaults here if desired
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molsten_output_win_max_height = 20
    end,
  },
}
