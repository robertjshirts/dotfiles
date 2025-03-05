-- .config/nvim/lua/config/autocmds.lua

local function setup_conform()
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  })
end

local function setup_json_settings()
  -- Create an autocommand group for JSON-specific settings
  vim.api.nvim_create_augroup("JsonSettings", { clear = true })

  -- Set tabstop and shiftwidth to 4 for JSON files
  vim.api.nvim_create_autocmd("FileType", {
    group = "JsonSettings",
    pattern = "json",
    callback = function()
      vim.bo.tabstop = 4
      vim.bo.shiftwidth = 4
    end,
  })
end

local function setup_neotree_dir_handler()
  -- Create an autocommand group for directory handling
  local augroup = vim.api.nvim_create_augroup("DirHandler", { clear = true })

  -- Open Neo-tree when Neovim starts with a directory argument
  vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup,
    callback = function()
      local arg = vim.fn.expand("%:p")
      if vim.fn.isdirectory(arg) == 1 then
        vim.cmd("Neotree " .. arg)
      end
    end,
  })
end

return {
  setup = function()
    setup_conform()
    setup_json_settings()
    setup_neotree_dir_handler()
  end,
}
