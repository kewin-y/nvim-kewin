local colors = require("themes." .. _G.theme)

require("mini.base16").setup({
	palette = colors,
})

local function hi(highlight, args)
    if args.fg == nil then args.fg = "none" end
    if args.bg == nil then args.bg = "none" end

    local cmd = "hi " .. highlight .. " guifg=" .. args.fg .. " guibg=" .. args.bg

    if args.gui ~= nil then
        cmd = cmd .. " gui=" .. args.gui
    end

    vim.cmd(cmd)
end

hi("WinSeparator", { fg = colors.base02 })
hi("NormalFloat", {bg = colors.base00 })
hi("VertSplit", { fg = colors.base01, bg = "none" })
hi("FloatBorder", { fg = colors.base03, bg = colors.base00 })
hi("LineNr", { fg = colors.base03, bg = "none" })
hi("SignColumn", { fg = colors.base03, bg = "none" })

hi("DiagnosticFloatingError" , { fg = colors.base08, bg = colors.base00, })
hi("DiagnosticFloatingHint" , { fg = colors.base0A, bg = colors.base00, })
hi("DiagnosticFloatingInfo" , { fg = colors.base0C, bg = colors.base00, })
hi("DiagnosticFloatingOk" , { fg = colors.base0B, bg = colors.base00, })
hi("DiagnosticFloatingWarn" , { fg = colors.base0E, bg = colors.base00, })
hi("DiagnosticSignError" , { fg = colors.base08, bg = colors.base00, })
hi("DiagnosticSignHint" , { fg = colors.base0A, bg = colors.base00, })
hi("DiagnosticSignInfo" , { fg = colors.base0C, bg = colors.base00, })
hi("DiagnosticSignOk" , { fg = colors.base0B, bg = colors.base00, })
hi("DiagnosticSignWarn" , { fg = colors.base0E, bg = colors.base00, })

hi("MiniFilesBorder",{fg = colors.base03})
hi("MiniFilesCursorLine",{bg = colors.base01})
hi("MiniFilesTitle",{bg= colors.base00})
hi("MiniFilesTitleFocused",{bg=colors.base00, gui="none"})
hi("MiniFilesBorderModified", { fg = colors.base0A, })
hi("MiniStarterItemPrefix", { fg = colors.base0D, })
hi("MiniFilesNormal", { fg = colors.base05, bg = colors.base00, })
