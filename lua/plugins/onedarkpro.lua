return {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        -- chargement du thème
        vim.cmd([[colorscheme onedark_vivid]])
    end,
}