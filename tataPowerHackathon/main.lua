-- Import required modules
local love = require("love")
local level1 = require("levels.level1")
local startgame = require("states.startgame")
local settingsModal = require("states.settingsModal")
local instructionsModal = require("states.instructionsModal")

-- Declare audio variables
local backgroundMusic

-- Initialize the game
function love.load()
    -- Set up the game window
    love.window.setTitle("EcoCraft Challenge")

    -- Set full screen mode with the appropriate display width and height
    local displayWidth, displayHeight = love.window.getDesktopDimensions()
    love.window.setMode(displayWidth, displayHeight, {fullscreen = false})

    -- Load background music
    backgroundMusic = love.audio.newSource("assets/sounds/bg.mp3", "stream")

    -- Set audio properties
    backgroundMusic:setVolume(0.5) -- Adjust the volume (0.0 to 1.0)
    backgroundMusic:setLooping(true) -- Loop the music
end

-- Update game logic
function love.update(dt)
    -- You can add logic here to handle the game state
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

    -- Play background music
    backgroundMusic:play()
end

-- Cleanup when the game exits
function love.quit()
    -- Stop and release audio resources
    backgroundMusic:stop()
    backgroundMusic:release()
end
