-- Import required modules
local love = require("love")
local level1 = require("levels.level1") -- Import the Level 1 module

-- Initialize the game
function love.load()
    -- Set up the game window
    love.window.setTitle("EcoCraft Challenge")
    
    -- Set full screen mode with the appropriate display width and height
    local displayWidth, displayHeight = love.window.getDesktopDimensions()
    love.window.setMode(displayWidth, displayHeight, {fullscreen = true})
    
    level1.load() -- Load Level 1
end

-- Update game logic
function love.update(dt)
    level1.update(dt) -- Update Level 1 logic
end

-- Render the game
function love.draw()
    level1.draw() -- Draw Level 1
end
