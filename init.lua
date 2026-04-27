require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.claude-commit-message")


vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  group = vim.api.nvim_create_augroup("ClaudeCommitMessage", { clear = true }),
  callback = function(args)
    print("gitcommit autocmd fired")
    local name = vim.fn.expand("%:t")
    if name ~= "COMMIT_EDITMSG" then
      return -- If in rebase or merge do not run
    end
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
    for _, line in ipairs(lines) do
      if line ~= "" and not line:match("^#") then
        return  -- amend or pre-filled message; leave alone
      end
    end
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(args.buf) then
        vim.cmd("ClaudeCommitMessage")
      end
    end)
  end,
})

