return {
  "folke/trouble.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      function()
        require("trouble").toggle("diagnostics")
      end,
      desc = "Toggle trouble list"
    },
    {
      "<leader>xf",
      function()
        require("trouble").toggle("diagnostics buf=0")
      end,
      desc = "Open trouble file diagnostics"
    },
    {
      "<leader>xq",
      function()
        require("trouble").toggle("quickfix")
      end,
      desc = "Open trouble quickfix list"
    },
    {
      "<leader>xl",
      function()
        require("trouble").toggle("loclist")
     end,
      desc = "Open trouble location list"
    },
    {
      "<leader>xt",
      "<cmd>TodoTrouble<CR>",
      desc = "Open todos in trouble"
    },
  },
}
