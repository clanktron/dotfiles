return {
    'narutoxy/silicon.lua',
    lazy = true,
    opts = {
	    theme = "auto",
	    output = "SILICON_${year}-${month}-${date}_${time}.png", -- auto generate file name based on time (absolute or relative to cwd)
	    bgColor = vim.g.terminal_color_5,
	    bgImage = "", -- path to image, must be png
	    roundCorner = true,
	    windowControls = true,
	    lineNumber = true,
	    font = "monospace",
	    lineOffset = 1, -- from where to start line number
	    linePad = 2, -- padding between lines
	    padHoriz = 80, -- Horizontal padding
	    padVert = 100, -- vertical padding
	    shadowBlurRadius = 10,
	    shadowColor = "#555555",
	    shadowOffsetX = 8,
	    shadowOffsetY = 8,
	    gobble = false, -- enable lsautogobble like feature
	    debug = false, -- enable debug output
    },
    config = function(_, opts)
        -- ensure proper background color
        vim.g.terminal_color_5 = '#15e3e3'
        require("silicon").setup(opts)
    end,
    keys = {
        { '<Leader>s', function() require("silicon").visualise_api() end, mode = "v", desc = "Generate image of lines in a visual selection" },
        { '<Leader>bs', function() require("silicon").visualise_api({to_clip = true, show_buf = true}) end, mode = "v", desc = "Generate image of a whole buffer, with lines in a visual selection highlighted" },
        { '<Leader>s',  function() require("silicon").visualise_api({to_clip = true, visible = true}) end,  desc = "Generate visible portion of a buffer" },
        { '<Leader>s',  function() require("silicon").visualise_api({to_clip = true}) end, desc = "Generate current buffer line in normal mode" },
    }
}
