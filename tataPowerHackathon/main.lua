-- Import required modules
local love = require("love")
local level1 = require("levels.level1")
local startgame = require("states.startgame")
local settingsModal = require("states.settingsModal")
local instructionsModal = require("states.instructionsModal")

-- Initialize the game
function love.load()
    -- Set up the game window
    love.window.setTitle("EcoCraft Challenge")

    -- Set full screen mode with the appropriate display width and height
    local displayWidth, displayHeight = love.window.getDesktopDimensions()
    love.window.setMode(displayWidth, displayHeight, {fullscreen = false})
end

-- Update game logic
function love.update(dt)
end

local currentScreen = "start"
function switchScreen(screenName)
    currentScreen = screenName
end


-- Render the game
function love.draw()
    if currentScreen == "start" then
        startgame.draw()
        settingsModal.draw() 
        instructionsModal.draw() 
    elseif currentScreen == "level1" then
        level1.draw()
    end
end
