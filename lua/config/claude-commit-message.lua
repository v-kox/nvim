vim.api.nvim_create_user_command("ClaudeCommitMessage", function()
    local diff = vim.fn.system("git diff --cached")
    if vim.v.shell_error ~= 0 or diff == "" then
      vim.notify("No staged diff (or git failed)", vim.log.levels.WARN)
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()

    vim.notify("Asking Claude for a commit message...", vim.log.levels.INFO)

    local prompt = table.concat({
      "Write a git commit message describing ONLY the changes contained inside the <diff>...</diff> block below.",
      "Do not invoke any tools. Do not run git. Do not read files. Do not infer from anything outside the <diff> block.",
      "",
      "For the title line, aim for a length of 50 characters, and do not exceed a length of 72 characters.",
      "In the body of the commit message enforce a line length of 80 characters.",
      "",
      "Do NOT wrap the output in code fences (```), backticks, or any markdown delimiters.",
      "Do NOT prefix with \"Commit message:\" or similar labels.",
      "Do NOT prefix the title with `feat(...)`, `bug(...)`, `hotfix(...)` or similar.",
      "",
      "The first character of your response must be the first character of the commit subject line.",
      "",
      "The body of the commit message can contain list item indicators (-) but no other markdown.",
      "",
      "<diff>",
      diff,
      "</diff>",
    }, "\n")

    vim.system(
      {
        "claude",
        "-p",
        prompt,
        "--disallowedTools",
        "Bash Read Grep Glob Edit Write WebFetch WebSearch Task Agent",
      },
      { text = true },
      vim.schedule_wrap(function(obj)
        if obj.code ~= 0 then
          vim.notify("claude failed: " .. (obj.stderr or ""), vim.log.levels.ERROR)
          return
        end

        local msg = (obj.stdout or ""):gsub("\n+$", "")
        local lines = vim.split(msg, "\n", { plain = true })

        vim.api.nvim_buf_set_text(bufnr, 0, 0, 0, 0, lines)
        vim.api.nvim_win_set_cursor(win, { 1, 0 })

        -- Clear notification
        vim.notify("")
      end)
    )
  end, { desc = "Insert a Claude-generated commit message at the top of the buffer" })
