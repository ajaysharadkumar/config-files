-- Load individual language debug configurations
local dap_languages = {
    "python",
    "node",
    "typescript",
  }
  
  for _, lang in ipairs(dap_languages) do
    local ok, _ = pcall(require, "config.dap." .. lang)
    if not ok then
      vim.notify("DAP config not found for " .. lang, vim.log.levels.WARN)
    end
  end
  