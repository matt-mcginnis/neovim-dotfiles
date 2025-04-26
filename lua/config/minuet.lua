require('minuet').setup {
    provider = 'gemini',
    provider_options = {
        gemini = {
            optional = {
                generationConfig = {
                    maxOutputTokens = 256,
                    topP = 0.9,
                },
            }
        }
    },
}
