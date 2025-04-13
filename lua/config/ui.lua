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
hi("VertSplit", { fg = colors.base01, bg = "none" })
hi("NormalFloat", {fg = colors.base05, bg = colors.base00 })
hi("FloatBorder", { fg = colors.base05, bg = colors.base00 })
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

hi("MiniFilesBorder",{fg = colors.base05})
hi("MiniFilesCursorLine",{bg = colors.base01})
hi("MiniFilesTitle",{bg= colors.base00})
hi("MiniFilesTitleFocused",{bg=colors.base00, gui="none"})
hi("MiniFilesBorderModified", { fg = colors.base0A, })
hi("MiniStarterItemPrefix", { fg = colors.base0D, })
hi("MiniFilesNormal", { fg = colors.base05, bg = colors.base00, })

hi("BlinkCmpMenu", { fg = colors.base05, bg = colors.base00 })
hi("BlinkCmpMenuBorder", { fg = colors.base05, bg = colors.base00 })
hi("BlinkCmpMenuSelection", { fg = colors.base05, bg = colors.base02})
hi("BlinkCmpKind", { bg = colors.base00})


hi("BlinkCmpKind" , {fg= colors.base05 })
hi("BlinkCmpKindText" , {fg= colors.base05})

hi("BlinkCmpKindClass" , {fg= colors.base0A })
hi("BlinkCmpKindConstructor" , {fg= colors.base0A })
hi("BlinkCmpKindEnum" , {fg= colors.base09 })
hi("BlinkCmpKindMethod" , {fg= colors.base09 })
hi("BlinkCmpKindFunction" , {fg= colors.base09 })
hi("BlinkCmpKindField" , {fg= colors.base08 })
hi("BlinkCmpKindVariable" , {fg= colors.base08 })
hi("BlinkCmpKindInterface" , {fg= colors.base0A })
hi("BlinkCmpKindModule" , {fg= colors.base0E })
hi("BlinkCmpKindProperty" , {fg= colors.base0E })
hi("BlinkCmpKindUnit" , {fg= colors.base09 })
hi("BlinkCmpKindValue" , {fg= colors.base09 })
hi("BlinkCmpKindKeyword" , {fg= colors.base0E })
hi("BlinkCmpKindSnippet" , {fg= colors.base0C})
hi("BlinkCmpKindColor" , {fg= colors.base09 })
hi("BlinkCmpKindFile" , {fg= colors.base0A })
hi("BlinkCmpKindReference" , {fg= colors.base0A})
hi("BlinkCmpKindFolder" , {fg= colors.base0A })
hi("BlinkCmpKindEnumMember" , {fg= colors.base09 })
hi("BlinkCmpKindConstant" , {fg= colors.base09 })
hi("BlinkCmpKindStruct" , {fg= colors.base0A })
hi("BlinkCmpKindEvent" , {fg= colors.base0E })
hi("BlinkCmpKindOperator" , {fg= 'Operator' })
hi("BlinkCmpKindTypeParameter" , {fg= colors.base0A })
