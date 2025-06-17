local M = {}

--- Scans for git project directories.
-- @param base_dir string: Directory to search from
-- @param max_depth number|string: Depth to search (default: 4)
-- @return table: List of { id = <project-name>, path = <full-path> }
function M.find_git_projects(base_dir, max_depth)
  base_dir = base_dir or (os.getenv("HOME") .. "/Developer")
  max_depth = tostring(max_depth or 4)

  local cmd = string.format(
    'find "%s" -type d -name .git -maxdepth %s 2>/dev/null',
    base_dir,
    max_depth
  )

  local handle = io.popen(cmd)
  if not handle then
    return {}
  end

  local result = {}
  for line in handle:lines() do
    local path = line:gsub("/%.git$", "") -- remove trailing /.git
    local id = path:match("([^/]+)$") or path
    table.insert(result, { id = id, path = path })
  end

  handle:close()
  return result
end

return M
