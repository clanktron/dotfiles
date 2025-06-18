local fuzzy_project = require("fuzzy_dir.projects")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}

M.fuzzy_find_projects = function()
  local base_dir = os.getenv("HOME") .. "/Developer"
  local projects = fuzzy_project.find_git_projects(base_dir)

  local entries = {}
  for _, project in ipairs(projects) do
    local rel_path = project.path:gsub("^" .. base_dir .. "/?", "")
    table.insert(entries, {
      display = rel_path,
      value = project.path,
      ordinal = rel_path,
    })
  end

  pickers.new({}, {
    prompt_title = "Git Projects",
    finder = finders.new_table({
      results = entries,
      entry_maker = function(entry)
        return {
          value = entry.value,
          display = entry.display,
          ordinal = entry.ordinal,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      map({"i", "n"}, "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        vim.fn.chdir(selection.value)
        -- use event loop schedule to avoid losing message to telescope UI redraw
        vim.schedule(function()
          vim.notify("Changed directory to: " .. selection.value, vim.log.levels.INFO)
        end)
      end)
      return true
    end,
  }):find()
end

return M
