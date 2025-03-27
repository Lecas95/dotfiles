return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require('lualine').setup {
        sections = {
          lualine_a = function()
            return "😄"
          end,
          lualine_z = {
            "location",
            unpack(opts.sections.lualine_z),
          },
        }
      }
    end,
  },
}
