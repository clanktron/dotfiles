local M = {}

function M.cd_to_zoxide(path)
  local handle
  local cmd = { "zoxide", "query" }

  if path == nil or path == "" then
    cmd = { "pwd" }
  else
    table.insert(cmd, path)
  end

  handle = io.popen(table.concat(cmd, " "))
  if handle == nil then
    vim.notify("Failed to run zoxide", vim.log.levels.ERROR)
    return
  end

  local result = handle:read("*a"):gsub("%s+$", "")
  handle:close()

  if result == "" then
    vim.notify("No matching directory found", vim.log.levels.WARN)
    return
  end

  vim.cmd("cd " .. result)
  vim.notify("Changed directory to: " .. result)
end

vim.api.nvim_create_user_command("CD", function(opts)
  M.cd_to_zoxide(opts.args)
end, { nargs = "?", desc = "Change directory using zoxide" })

return M
