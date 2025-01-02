return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    keys = {
      -- Switch step out and step over
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    optional = true,
    opts = {
      virt_text_win_col = 80,
    },
  },
}
