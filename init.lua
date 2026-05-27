require("core")
require("config.lazy")

-- .h considered as C file
vim.filetype.add({
    extension = {
        h = "c",
    },
})

-- config Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        vim.treesitter.start()
    end,
})

-- config SystemVerilog for CVA6
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "systemverilog", "verilog" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
        vim.treesitter.start()
    end,
})

