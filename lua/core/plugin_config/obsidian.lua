require("obsidian").setup({
    lazy = true,
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre" .. vim.fn.expand "~" .. "Github/mckinney/ai-obsidian/**.md",
      "BufNewFile" .. vim.fn.expand "~" .. "Github/mckinney/ai-obsidian/**.md",
    },
    workspaces = {
        {
            name = "work",
            path = "~/vaults/work",
        },
        {
            name = "personal",
            path = "~/vaults/personal",
        },
        {
            name = "ai-innovation",
            path = "~/Github/mckinney/ai-obsidian",
        },
        {
            name = "analytics",
            path = "~/Github/mckinney/analytics-obsidian",
        },
    },
    -- Optional, for templates (see below).
    templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
    },
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,

        -- Trigger completion at 2 chars.
        min_chars = 2,
    },
    new_notes_location = "current_dir",
    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return tostring(os.time()) .. "-" .. suffix
    end,
    -- Optional, customize how wiki links are formatted. You can set this to one of:
    --  * "use_alias_only", e.g. '[[Foo Bar]]'
    --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
    --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
    --  * "use_path_only", e.g. '[[foo-bar.md]]'
    -- Or you can set it to a function that takes a table of options and returns a string, like this:
    wiki_link_func = function(opts)
        return require("obsidian.util").wiki_link_id_prefix(opts)
    end,
    follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({"open", url})  -- Mac OS
  end,
})

vim.keymap.set("n", "<leader>og", ":ObsidianFollowLink<cr>")
vim.keymap.set("v", "<leader>ol", ":ObsidianLink<cr>")
vim.keymap.set("v", "<leader>oL", ":ObsidianLinkNew<cr>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew<cr>")
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<cr>")
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<cr>")
vim.keymap.set("n", "<leader>off", ":ObsidianQuickSwitch<cr>")
vim.keymap.set("n", "<leader>ofs", ":ObsidianSearch<cr>")
vim.keymap.set("n", "<leader>owp", ":ObsidianWorkspace personal<cr>")
vim.keymap.set("n", "<leader>oww", ":ObsidianWorkspace work<cr>")
vim.keymap.set("n", "<leader>owa", ":ObsidianWorkspace ai-innovation<cr>")
vim.keymap.set("n", "<leader>owd", ":ObsidianWorkspace analytics<cr>")
