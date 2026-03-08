return {
  "coder/claudecode.nvim",
  config = function()
    require("claudecode").setup({
      auto_start = true,
      port_range = { min = 10000, max = 65535 },
      terminal = {
        split_side = "right",
        split_width_percentage = 0.4,
        provider = "native",
      },
      diff_opts = {
        auto_close_on_accept = true,
        show_diff_stats = true,
      },
    })
  end,
}
