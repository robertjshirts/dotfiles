return {
  'stevearc/overseer.nvim',
  dependencies = {
    { 'stevearc/dressing.nvim', opts = {} },
    'rcarriga/nvim-notify'
  },
  config = function()
    require('overseer').setup {
      task_list = { direction = 'right' },
    }
    vim.notify = require('notify')
    vim.keymap.set('n', '<leader>tt', '<CMD>OverseerToggle<CR>', { desc = 'Toggle Overseer' })
    vim.keymap.set('n', '<leader>tr', '<CMD>OverseerRun<CR>', { desc = 'Run a task' })
  end
}
