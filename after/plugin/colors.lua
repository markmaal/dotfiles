local status,_ = pcall(vim.cmd, "colorscheme rose-pine")
if not status then
    print("Color scheme not found!")
    return
end
