-- show path
vim.api.nvim_create_user_command("Path", "echo expand('%:p')", {})

-- no more case sensitive saves or quits
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
