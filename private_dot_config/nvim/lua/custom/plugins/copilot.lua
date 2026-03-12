return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = false, -- blink-copilot で統合するため無効化
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
        gitignore = true,
        ['.'] = false, -- 未知のファイルタイプでは無効
      },
    },
  },
  {
    'fang2hou/blink-copilot',
    dependencies = { 'zbirenbaum/copilot.lua' },
    opts = {
      max_completions = 3,
      max_attempts = 4,
    },
  },
}
