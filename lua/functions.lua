local M = {}

function M.generate_commit_message()
  -- Get the git diff for staged changes
  local handle = io.popen "git diff --staged"
  local diff = handle:read "*a"
  handle:close()

  if diff == "" then
    vim.notify("No staged changes to generate commit message from.", vim.log.levels.WARN)
    return
  end

  -- Open a new commit message buffer
  vim.cmd "tabnew"
  local buf = vim.api.nvim_get_current_buf()

  -- Set buffer options
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "filetype", "gitcommit")

  -- Add initial content
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    "# Generate a commit message for these changes:",
    "#",
  })

  -- Add diff as comments
  local diff_lines = vim.split(diff, "\n")
  for i, line in ipairs(diff_lines) do
    diff_lines[i] = "# " .. line
  end
  vim.api.nvim_buf_set_lines(buf, 2, -1, false, diff_lines)

  -- Move cursor to the top and enter insert mode
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
  vim.cmd "startinsert"

  -- Wait a bit for Copilot to initialize and then trigger suggestion
  vim.defer_fn(function()
    vim.cmd "Copilot enable"
    vim.cmd "Copilot suggestion"
  end, 100)
end

return M
