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

return {
  setup = function()
    setup_conform()
    setup_json_settings()
  end,
}
