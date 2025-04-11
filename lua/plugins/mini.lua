return {
  {
    'echasnovski/mini.files',
    opts = {
      prefix = function() end
    },
    version = false
  },
  {
    'echasnovski/mini.base16',
    lazy = true,
    version = false
  },
  {
    'echasnovski/mini.starter',
    opts = {
      evaluate_single = true,
      header = "hello",
      content_hooks = {
        require('mini.starter').gen_hook.aligning('center', 'center'),
      },
      items = {
        require('mini.starter').sections.builtin_actions(),
        require('mini.starter').sections.recent_files(5, true, false),
        require('mini.starter').sections.recent_files(5, false, false),
      },
    },
    version = false
  },
}
