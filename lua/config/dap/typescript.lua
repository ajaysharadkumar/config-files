local dap = require("dap")

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {
    vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js"
  },
}

dap.configurations.typescript = {
  {
    name = "Launch file (ts-node)",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
    runtimeExecutable = "ts-node",
    runtimeArgs = { "--loader", "ts-node/esm" }, -- For ESM projects
    skipFiles = { "<node_internals>/**" },
  },
}
