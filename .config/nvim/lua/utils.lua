local cmd = vim.cmd
local fn = vim.fn

local M = {}

M.notify = function(message, level, title)
  local notify_options = {
    title = title,
    timeout = 2000,
  }
  require("notify")(message, level, notify_options)
end

--- Check if path exists
M.path_exists = function(path)
  local ok = vim.loop.fs_stat(path)
  return ok
end

M.telescope_find_files = function()
  local path = vim.loop.cwd() .. "/.git"
  if M.path_exists(path) then
    return "Telescope git_files"
  else
    return "Telescope find_files"
  end
end

return M
