return {
    {
      "mfussenegger/nvim-dap",  -- Core DAP plugin
      dependencies = {
        -- UI for the debugger
        {
          "rcarriga/nvim-dap-ui",
          dependencies = {
            "nvim-neotest/nvim-nio", -- ✅ required now
          },
          config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
        
            dap.listeners.after.event_initialized["dapui_config"] = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
              dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
              dapui.close()
            end
          end,
        },

        -- Virtual text for debugging
        {
          "theHamsta/nvim-dap-virtual-text",
          opts = {},
        },
      },
    },
  
    -- Optional: Install adapters via mason
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "williamboman/mason.nvim" },
      config = function()
        require("mason-nvim-dap").setup({
          ensure_installed = { "python" },
          automatic_setup = true,
          handlers = {},  -- ✅ Use this instead of calling .setup_handlers()
        })
      end,
    },
  }
  