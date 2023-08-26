return {
    'narutoxy/silicon.lua',
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
    config = function()
        local silicon = require('silicon')
        -- ensure proper background color
        vim.g.terminal_color_5 = '#15e3e3'
        -- Generate image of lines in a visual selection
        vim.keymap.set('v', '<Leader>s', function() silicon.visualise_api({}) end )
        -- Generate image of a whole buffer, with lines in a visual selection highlighted
        vim.keymap.set('v', '<Leader>bs', function() silicon.visualise_api({to_clip = true, show_buf = true}) end )
        -- Generate visible portion of a buffer
        vim.keymap.set('n', '<Leader>s',  function() silicon.visualise_api({to_clip = true, visible = true}) end )
        -- Generate current buffer line in normal mode
        vim.keymap.set('n', '<Leader>s',  function() silicon.visualise_api({to_clip = true}) end )
    end,
}
