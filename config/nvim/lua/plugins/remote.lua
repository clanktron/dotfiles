return {
   "hmk114/remote-nvim.nvim",
   dependencies = {
       "nvim-lua/plenary.nvim", -- For standard functions
       "MunifTanjim/nui.nvim", -- To build the plugin UI
       "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
   },
   opts = {
      client_callback = function(port, _)
        local exit_code = vim.fn.jobstart({"open", "-na", "ghostty", "--args", "-e", ("nvim --remote-ui --server localhost:%s"):format(port)}, { detach = true })
        if exit_code ~= 0 then
          vim.notify(("Local client failed with exit code %s"):format(exit_code), vim.log.levels.ERROR)
        end
      end,
   },
   config = true
}
