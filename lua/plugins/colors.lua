local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

local function set_nightfox()
    -- Set Nightfox theme (Pitch Black version)
    vim.cmd.colorscheme("nightfox")

    -- Optional: Set a pitch black background if the theme allows it
    vim.cmd("hi Normal guibg=#000000")  -- Set pitch black background (adjust this if necessary)
    vim.cmd('hi Directory guibg=NONE')
    vim.cmd('hi SignColumn guibg=NONE')

    -- Enable transparency for certain UI elements
    enable_transparency()
end

return {
    {
        "EdenEast/nightfox.nvim",
        config = set_nightfox
    }
}
