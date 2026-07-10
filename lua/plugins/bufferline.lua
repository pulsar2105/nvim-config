return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            separator_style = "thick",
            max_name_length = 30,
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        },
    },
}
