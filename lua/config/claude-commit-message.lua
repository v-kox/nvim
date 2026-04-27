vim.api.nvim_create_user_command("ClaudeCommitMessage", function()
    local diff = vim.fn.system("git diff --cached")
    if vim.v.shell_error ~= 0 or diff == "" then
      vim.notify("No staged diff (or git failed)", vim.log.levels.WARN)
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()

    vim.notify("Asking Claude for a commit message...", vim.log.levels.INFO)

    vim.system(
      { "claude", "-p", [[ 
            Write a git commit message for this diff.
            For the title line, aim for a length of 50 characters, 
            and do not exceed a length of 72 characters
            In the body of the commit message enforce a line length of 80 characters.
            With the exception of possible list indicators, do not include Markdown
            in the message.
            Output only the message, no preamble.
                ]] },
      { stdin = diff, text = true },
      vim.schedule_wrap(function(obj)
        if obj.code ~= 0 then
          vim.notify("claude failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
          return
        end

        local msg = (obj.stdout or ""):gsub("\n+$", "")
        local lines = vim.split(msg, "\n", { plain = true })

        vim.api.nvim_buf_set_text(bufnr, 0, 0, 0, 0, lines)

        vim.api.nvim_win_set_cursor(win, { #lines, #lines[#lines] })
      end)
    )
  end, { desc = "Insert a Claude-generated commit message at the top of the buffer" })
