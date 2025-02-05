local function setup_conform()
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end
  })
end

return {
  setup = setup_conform,
}
