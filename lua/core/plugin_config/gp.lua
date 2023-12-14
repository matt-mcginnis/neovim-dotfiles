require("gp").setup()

local function keymapOptions(desc)
    return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
    }
end

-- Chat open commands
vim.keymap.set({"n", "i"}, "<C-e>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({"n", "i"}, "<C-e>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
vim.keymap.set({"n", "i"}, "<C-e>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))

vim.keymap.set("v", "<C-e>c", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set("v", "<C-e>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
vim.keymap.set("v", "<C-e>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))

vim.keymap.set({ "n", "i" }, "<C-e>x", "<cmd>GpChatNew split<cr>", keymapOptions("New Chat split"))
vim.keymap.set({ "n", "i" }, "<C-e>v", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
vim.keymap.set({ "n", "i" }, "<C-e><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))

vim.keymap.set("v", "<C-e>x", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))
vim.keymap.set("v", "<C-e>v", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
vim.keymap.set("v", "<C-e><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))

-- Chat interaction commands
vim.keymap.set({"n", "i"}, "<C-e>n", "<cmd>GpChatRespond<cr>", keymapOptions("Respond in Chat"))
vim.keymap.set({"n", "i"}, "<C-e>d", "<cmd>GpChatDelete<cr>", keymapOptions("Delete Chat"))
vim.keymap.set({"n", "i"}, "<C-e>s", "<cmd>GpChatStop<cr>", keymapOptions("Stop Chat"))


-- Prompt commands
vim.keymap.set({"n", "i"}, "<C-e>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set({"n", "i"}, "<C-e>a", "<cmd>GpAppend<cr>", keymapOptions("Append (after)"))
vim.keymap.set({"n", "i"}, "<C-e>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend (before)"))

vim.keymap.set("v", "<C-e>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-e>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))
vim.keymap.set("v", "<C-e>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions("Visual Prepend (before)"))
vim.keymap.set("v", "<C-e>i", ":<C-u>'<,'>GpImplement<cr>", keymapOptions("Implement selection"))

vim.keymap.set({"n", "i"}, "<C-e>gp", "<cmd>GpPopup<cr>", keymapOptions("Popup"))
vim.keymap.set({"n", "i"}, "<C-e>ge", "<cmd>GpEnew<cr>", keymapOptions("GpEnew"))
vim.keymap.set({"n", "i"}, "<C-e>gn", "<cmd>GpNew<cr>", keymapOptions("GpNew"))
vim.keymap.set({"n", "i"}, "<C-e>gv", "<cmd>GpVnew<cr>", keymapOptions("GpVnew"))
vim.keymap.set({"n", "i"}, "<C-e>gt", "<cmd>GpTabnew<cr>", keymapOptions("GpTabnew"))

vim.keymap.set("v", "<C-e>gp", ":<C-u>'<,'>GpPopup<cr>", keymapOptions("Visual Popup"))
vim.keymap.set("v", "<C-e>ge", ":<C-u>'<,'>GpEnew<cr>", keymapOptions("Visual GpEnew"))
vim.keymap.set("v", "<C-e>gn", ":<C-u>'<,'>GpNew<cr>", keymapOptions("Visual GpNew"))
vim.keymap.set("v", "<C-e>gv", ":<C-u>'<,'>GpVnew<cr>", keymapOptions("Visual GpVnew"))
vim.keymap.set("v", "<C-e>gt", ":<C-u>'<,'>GpTabnew<cr>", keymapOptions("Visual GpTabnew"))

vim.keymap.set({"n", "i"}, "<C-e>x", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))
vim.keymap.set("v", "<C-e>x", ":<C-u>'<,'>GpContext<cr>", keymapOptions("Visual Toggle Context"))

vim.keymap.set({"n", "i", "v", "x"}, "<C-e>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))
vim.keymap.set({"n", "i", "v", "x"}, "<C-e>n", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))

-- optional Whisper commands with prefix <C-e>w
vim.keymap.set({"n", "i"}, "<C-e>ww", "<cmd>GpWhisper<cr>", keymapOptions("Whisper"))
vim.keymap.set("v", "<C-e>ww", ":<C-u>'<,'>GpWhisper<cr>", keymapOptions("Visual Whisper"))

vim.keymap.set({"n", "i"}, "<C-e>wr", "<cmd>GpWhisperRewrite<cr>", keymapOptions("Whisper Inline Rewrite"))
vim.keymap.set({"n", "i"}, "<C-e>wa", "<cmd>GpWhisperAppend<cr>", keymapOptions("Whisper Append (after)"))
vim.keymap.set({"n", "i"}, "<C-e>wb", "<cmd>GpWhisperPrepend<cr>", keymapOptions("Whisper Prepend (before) "))

vim.keymap.set("v", "<C-e>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", keymapOptions("Visual Whisper Rewrite"))
vim.keymap.set("v", "<C-e>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", keymapOptions("Visual Whisper Append (after)"))
vim.keymap.set("v", "<C-e>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", keymapOptions("Visual Whisper Prepend (before)"))

vim.keymap.set({"n", "i"}, "<C-e>wp", "<cmd>GpWhisperPopup<cr>", keymapOptions("Whisper Popup"))
vim.keymap.set({"n", "i"}, "<C-e>we", "<cmd>GpWhisperEnew<cr>", keymapOptions("Whisper Enew"))
vim.keymap.set({"n", "i"}, "<C-e>wn", "<cmd>GpWhisperNew<cr>", keymapOptions("Whisper New"))
vim.keymap.set({"n", "i"}, "<C-e>wv", "<cmd>GpWhisperVnew<cr>", keymapOptions("Whisper Vnew"))
vim.keymap.set({"n", "i"}, "<C-e>wt", "<cmd>GpWhisperTabnew<cr>", keymapOptions("Whisper Tabnew"))

vim.keymap.set("v", "<C-e>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", keymapOptions("Visual Whisper Popup"))
vim.keymap.set("v", "<C-e>we", ":<C-u>'<,'>GpWhisperEnew<cr>", keymapOptions("Visual Whisper Enew"))
vim.keymap.set("v", "<C-e>wn", ":<C-u>'<,'>GpWhisperNew<cr>", keymapOptions("Visual Whisper New"))
vim.keymap.set("v", "<C-e>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", keymapOptions("Visual Whisper Vnew"))
vim.keymap.set("v", "<C-e>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", keymapOptions("Visual Whisper Tabnew"))
