local config = {
    openai_api_key = os.getenv("OPENAI_API_KEY"),
    -- example of adding command which explains the selected code
    hooks = {
        Explain = function(gp, params)
            local template = "I have the following code from {{filename}}:\n\n"
                .. "```{{filetype}}\n{{selection}}\n```\n\n"
                .. "Please respond by explaining the code above."
            local agent = gp.get_chat_agent()
            gp.Prompt(params, gp.Target.popup, agent, template)
        end,
    }
}

require("gp").setup(config)

local function keymapOptions(desc)
    return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
    }
end

-- Chat open commands
vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))

vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))

-- Chat interaction commands
vim.keymap.set({ "n", "i" }, "<C-g>n", "<cmd>GpChatRespond<cr>", keymapOptions("Respond in Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>d", "<cmd>GpChatDelete<cr>", keymapOptions("Delete Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>s", "<cmd>GpChatStop<cr>", keymapOptions("Stop Chat"))

-- Prompt commands
vim.keymap.set({ "n", "i" }, "<C-g>w", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpAppend<cr>", keymapOptions("Append (after)"))
vim.keymap.set({ "n", "i" }, "<C-g>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend (before)"))
vim.keymap.set("v", "<C-g>w", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))
vim.keymap.set("v", "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions("Visual Prepend (before)"))

vim.keymap.set("v", "<C-g>e", ":<C-u>'<,'>GpExplain<cr>", keymapOptions("Explain code selection"))
vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpReview<cr>", keymapOptions("Review code selection"))
vim.keymap.set("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", keymapOptions("Implement selection"))

vim.keymap.set({ "n", "i" }, "<C-g>gn", "<cmd>GpVnew<cr>", keymapOptions("GpVnew"))
vim.keymap.set("v", "<C-g>gn", ":<C-u>'<,'>GpVnew<cr>", keymapOptions("Visual GpVnew"))

-- Handle Context and Agents
vim.keymap.set({ "n", "i" }, "<C-g>x", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))
vim.keymap.set("v", "<C-g>x", ":<C-u>'<,'>GpContext<cr>", keymapOptions("Visual Toggle Context"))

vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))
vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>m", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))

-- optional Whisper commands with prefix <C-e>w
vim.keymap.set({ "n", "i" }, "<C-g>wt", "<cmd>GpWhisper<cr>", keymapOptions("Whisper"))
vim.keymap.set("v", "<C-g>wt", ":<C-u>'<,'>GpWhisper<cr>", keymapOptions("Visual Whisper"))

vim.keymap.set({ "n", "i" }, "<C-g>ww", "<cmd>GpWhisperRewrite<cr>", keymapOptions("Whisper Inline Rewrite"))
vim.keymap.set({ "n", "i" }, "<C-g>wa", "<cmd>GpWhisperAppend<cr>", keymapOptions("Whisper Append (after)"))
vim.keymap.set({ "n", "i" }, "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", keymapOptions("Whisper Prepend (before) "))
vim.keymap.set("v", "<C-g>ww", ":<C-u>'<,'>GpWhisperRewrite<cr>", keymapOptions("Visual Whisper Rewrite"))
vim.keymap.set("v", "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", keymapOptions("Visual Whisper Append (after)"))
vim.keymap.set("v", "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", keymapOptions("Visual Whisper Prepend (before)"))

vim.keymap.set({ "n", "i" }, "<C-g>wn", "<cmd>GpWhisperVnew<cr>", keymapOptions("Whisper Vnew"))
vim.keymap.set("v", "<C-g>wn", ":<C-u>'<,'>GpWhisperVnew<cr>", keymapOptions("Visual Whisper Vnew"))
