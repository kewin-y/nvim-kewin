local colors = require("themes." .. _G.theme)

require("mini.base16").setup({
	palette = colors,
})

local function hi(highlight, args)
  if args.fg == nil then args.fg = "none" end
  if args.bg == nil then args.bg = "none" end
  vim.cmd("hi " .. highlight .. " guifg=" .. args.fg .. " guibg=" .. args.bg)
end

hi("WinSeparator", { fg = colors.base02 })
hi("NormalFloat", {bg = colors.base00 })
hi("VertSplit", { fg = colors.base01, bg = "none" })
hi("FloatBorder", { fg = colors.base03, bg = colors.base00 })
hi("LineNr", { fg = colors.base03, bg = "none" })
hi("SignColumn", { fg = colors.base03, bg = "none" })
hi("MiniFilesBorder",{fg = colors.base03})
hi("MiniFilesCursorLine",{bg = colors.base01})
hi("MiniFilesTitle",{bg= colors.base00})
hi("MiniFilesTitleFocused",{bg=colors.base00})
vim.cmd("hi MiniFilesTitleFocused gui=none")
hi("MiniFilesBorderModified", { fg = colors.base0A, })
hi("MiniStarterItemPrefix", { fg = colors.base0D, })
hi("MiniFilesNormal", { fg = colors.base05, bg = colors.base00, })

--
    -- Diagnostics
    -- DiagnosticFloatingError = {
    --   fg = colors.base08;
    --   bg = colors.base00;
    -- };
    -- DiagnosticFloatingHint = {
    --   fg = colors.base0A;
    --   bg = colors.base00;
    -- };
    -- DiagnosticFloatingInfo = {
    --   fg = colors.base0C;
    --   bg = colors.base00;
    -- };
    -- DiagnosticFloatingOk = {
    --   fg = colors.base0B;
    --   bg = colors.base00;
    -- };
    -- DiagnosticFloatingWarn = {
    --   fg = colors.base0E;
    --   bg = colors.base00;
    -- };
    -- DiagnosticSignError = {
    --   fg = colors.base08;
    --   bg = colors.base00;
    -- };
    -- DiagnosticSignHint = {
    --   fg = colors.base0A;
    --   bg = colors.base00;
    -- };
    -- DiagnosticSignInfo = {
    --   fg = colors.base0C;
    --   bg = colors.base00;
    -- };
    -- DiagnosticSignOk = {
    --   fg = colors.base0B;
    --   bg = colors.base00;
    -- };
    -- DiagnosticSignWarn = {
    --   fg = colors.base0E;
    --   bg = colors.base00;
    -- };
