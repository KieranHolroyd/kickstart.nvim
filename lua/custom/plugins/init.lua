-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<Tab>',
            reject = '<S-Tab>',
          },
        },
        panel = { enabled = true },
      }
    end,
  },
  { 'sbdchd/neoformat' },
  {
    'vuki656/package-info.nvim',
    config = function()
      require('package-info').setup {}
      -- Show dependency versions
      vim.keymap.set({ 'n' }, '<LEADER>ns', require('package-info').show, { silent = true, noremap = true })
      -- Hide dependency versions
      vim.keymap.set({ 'n' }, '<LEADER>nc', require('package-info').hide, { silent = true, noremap = true })
      -- Toggle dependency versions
      vim.keymap.set({ 'n' }, '<LEADER>nt', require('package-info').toggle, { silent = true, noremap = true })
      -- Update dependency on the line
      vim.keymap.set({ 'n' }, '<LEADER>nu', require('package-info').update, { silent = true, noremap = true })
      -- Delete dependency on the line
      vim.keymap.set({ 'n' }, '<LEADER>nd', require('package-info').delete, { silent = true, noremap = true })
      -- Install a new dependency
      vim.keymap.set({ 'n' }, '<LEADER>ni', require('package-info').install, { silent = true, noremap = true })
      -- Install a different dependency version
      vim.keymap.set({ 'n' }, '<LEADER>np', require('package-info').change_version, { silent = true, noremap = true })
    end,
  },
  {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = ' <summary> • <date> • <author> • <<sha>>', -- template for the blame message, check the Message template section for more options
      date_format = '%m-%d-%Y %H:%M:%S', -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
}
