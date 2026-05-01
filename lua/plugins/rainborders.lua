local function setup()
    -- split a string with a custom separator
    local function split_str(inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end
        return t
    end

    -- creat if needed a directory in the cache
    local home = os.getenv("HOME")
    local cache_path = home .. "/.cache/nvim/rainborders"
    local instances_path = cache_path .. "/instances"

    if vim.fn.isdirectory(cache_path) == 0 then
        vim.fn.mkdir(cache_path, "p")
    end

    -- ensure instances file exists (create if missing)
    local f1 = io.open(instances_path, "a+")
    if f1 then
        f1:close()
    end

    -- detect other nvim instances currently running
    local active_instances = {} -- array of array {pid, nb}
    local active_instances_nb = {}
    local current_pid = vim.fn.getpid()

    local f_read = io.open(instances_path, "r")
    if f_read then
        for line in f_read:lines() do
            -- parse the line
            local line_split = split_str(line, " ")
            local pid = tonumber(line_split[1])
            local nb = tonumber(line_split[2])

            -- we verify if the pid parsed is not our pid
            if pid and pid ~= current_pid then
                local ok, alive = pcall(vim.loop.kill, pid, 0)
                if ok and alive then
                    table.insert(active_instances, { pid, nb })
                    table.insert(active_instances_nb, nb)
                end
            end
        end
        f_read:close()
    end

    -- we add ourself in the alive list
    table.insert(active_instances, { current_pid, nil })

    -- we determine what are our number is to avoid any lack of number
    table.sort(active_instances_nb)
    local num_instance = 1
    local k = 1
    while k == active_instances_nb[k] do
        k = k + 1
    end
    num_instance = k

    -- remove dead and duplicate
    local f_write = io.open(instances_path, "w")
    if f_write then
        for _, pid_nb in ipairs(active_instances) do
            if pid_nb[1] == current_pid then
                f_write:write(pid_nb[1] .. " " .. num_instance .. "\n")
            else
                f_write:write(pid_nb[1] .. " " .. pid_nb[2] .. "\n")
            end
        end
        f_write:close()
    end

    -- Debug
    -- for _, pid in ipairs(active_instances) do
    --     vim.notify("active instances : " .. pid)
    -- end

    -- List of colors used by rainborders in order of windows opening.
    local colors = { "#456ABA", "#9145BA", "#C23E9E", "#B53C3C", "#D17728", "#DEDE47", "#80C458", "#58C4BD" }
    local num_colors = #colors

    -- fg: couleur du trait, bg: none pour la transparence
    vim.api.nvim_set_hl(0, "VerticalBar", { fg = colors[num_instance % num_colors], bg = "none" })

    -- %#VerticalBar#▌%* -> Notre barre avec son style
    -- %s                   -> Les signes (Gitsigns, diagnostics, etc.)
    -- %l                   -> Les numéros de ligne
    -- %=                   -> Espacement
    -- local rb_chr = "▌"
    local rb_chr = "█"
    vim.o.statuscolumn = "%#VerticalBar#" .. rb_chr .. "%*%s%l "
end

return {
    dir = vim.fn.stdpath("config"),
    name = "rainborders",
    lazy = false,
    priority = 1000,
    config = setup,
}
