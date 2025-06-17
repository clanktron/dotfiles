package.path = os.getenv("HOME") .. "/.config/nvim/lua/?.lua;" .. package.path
package.path = os.getenv("HOME") .. "/.config/nvim/lua/?/?.lua;" .. package.path
local wezterm = require("wezterm")
local act = wezterm.action
local projects = require("fuzzy_dir.projects")

local M = {}

M.toggle = function(window, pane)
  local choices = {}
  for _, project in ipairs(projects.find_git_projects()) do
    table.insert(choices, { label = project.path, id = project.id })
  end

  window:perform_action(
    act.InputSelector({
      title = "Select Project",
      fuzzy = true,
      choices = choices,
      action = wezterm.action_callback(function(win, _, id, label)
        if id and label then
          win:perform_action(
            act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }),
            pane
          )
        end
      end)
    }),
    pane
  )
end

return M
