local cmp = require("cmp")

cmp.setup({
    completion = {
        autocomplete = false
    },
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-s>"] = cmp.mapping.complete(),
        ["<C-f>"] = cmp.mapping.confirm({ select = true })
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" }
    })
})
