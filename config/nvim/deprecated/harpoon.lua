return {
    'theprimeagen/harpoon',
    lazy = true,
    keys = {
        { '<leader>a', function() require("harpoon.mark").add_file {} end, desc = "harpoon add file" },
        { '<C-e>', function() require("harpoon.ui").toggle_quick_menu {} end, desc = "toggle harpoon menu" },
        { '<leader>1', function() require("harpoon.ui").nav_file(1) {} end, desc = "navigate to harpoon file 1" },
        { '<leader>2', function() require("harpoon.ui").nav_file(2) {} end, desc = "navigate to harpoon file 2" },
        { '<leader>3', function() require("harpoon.ui").nav_file(3) {} end, desc = "navigate to harpoon file 3" },
        { '<leader>4', function() require("harpoon.ui").nav_file(4) {} end, desc = "navigate to harpoon file 4" },
    },
    enabled = false,
}
