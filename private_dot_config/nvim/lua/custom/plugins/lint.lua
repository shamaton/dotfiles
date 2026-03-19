return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      -- Run actionlint only on GitHub Actions workflow/action files
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        callback = function()
          local filepath = vim.api.nvim_buf_get_name(0)
          if filepath:match '%.github/workflows/' or filepath:match '%.github/actions/' then
            lint.try_lint 'actionlint'
          end
        end,
      })
    end,
  },
}
