return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      vim.treesitter.language.register("typescript", "tsx")

      -- ensure parsers are installed
      local ensure = {
        "vue", "typescript", "tsx", "rust", "css", "html",
        "javascript", "lua", "json", "yaml", "markdown", "bash", "toml",
      }
      for _, lang in ipairs(ensure) do
        local ok = pcall(vim.treesitter.language.add, lang)
        if not ok then
          vim.cmd("TSInstall " .. lang)
        end
      end

      -- enable highlight and indent via vim options
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        max_lines = 3,
        trim_scope = "outer",
      })
    end,
  },
}
