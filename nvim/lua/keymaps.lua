local map = vim.keymap.set

-- General
map("n", "<leader>nh", ":nohl<CR>", { silent = true, desc = "Clear search" })

-- NvimTree
map("n", "<leader>f", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })

-- Lspsaga
map("n", "<leader>t", ":Lspsaga term_toggle<CR>", { silent = true, desc = "Toggle terminal" })
map("n", "f", ":Lspsaga goto_definition<CR>", { silent = true, desc = "Go to definition" })
map("n", "Q", ":Lspsaga code_action<CR>", { silent = true, desc = "Code action" })
map("n", "e", ":Lspsaga diagnostic_jump_next<CR>", { silent = true, desc = "Next diagnostic" })
map("n", "E", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true, desc = "Prev diagnostic" })
map("n", "F", ":Lspsaga peek_definition<CR>", { silent = true, desc = "Peek definition" })
map("n", "D", ":Lspsaga hover_doc<CR>", { silent = true, desc = "Hover doc" })

-- Telescope
map("n", "<leader>s", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>S", "<CMD>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>b", "<CMD>Telescope buffers<CR>", { desc = "Buffers" })

-- Format
map({ "n", "v" }, "<leader>mp", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range" })

-- Claude Code
map("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })
map("n", "<leader>cs", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
map("v", "<leader>cs", "<cmd>ClaudeCodeSend<cr>", { desc = "Send selection to Claude" })
map("n", "<leader>co", "<cmd>ClaudeCodeOpen<cr>", { desc = "Open Claude Code" })
map("n", "<leader>cx", "<cmd>ClaudeCodeClose<cr>", { desc = "Close Claude Code" })

-- Auto-reload files
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = { "*" },
  command = "if mode() != 'c' | checktime | endif",
})
