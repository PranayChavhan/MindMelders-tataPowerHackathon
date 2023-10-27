-- Import required modules
local love = require("love")
local level1 = require("levels.level1") -- Import the Level 1 module
Player = require 'objects/player'
Minigame = require 'objects/minigame'

local gameState = "main" 
local miniGameInstance
-- Initialize the game
function love.load()
    anim8 = require 'libraries/anim8'
    -- to avoid blurry image
    love.graphics.setDefaultFilter("nearest", "nearest")
    -- Set up the game window   
    love.window.setTitle("EcoCraft Challenge")

    -- Initialize minigame
    miniGameInstance = Minigame.new()
    
    -- Set full screen mode with the appropriate display width and height
    -- local displayWidth, displayHeight = love.window.getDesktopDimsensions()
    -- love.window.setMode(displayWidth, displayHeight, {fullscreen = false})
    
    player = Player.create('10','12')

end

-- Update game logic
function love.update(dt)
    -- level1.update(dt) -- Update Level 1 logic
    if love.keyboard.isDown('e') and gameState == "main" then
        miniGameInstance:load()
        miniGameInstance.active = true  
        gameState = "minigame"
    end
    if miniGameInstance.active then
        miniGameInstance:update(dt)
    end

    if gameState == "minigame" then
        miniGameInstance:update(dt)
    else
        player:update(dt)
    end

end

-- Render the game
function love.draw()
    -- level1.draw() -- Draw Level 1

    if gameState == "minigame" then
        miniGameInstance:draw()
    else
        love.graphics.print("Press E to start minigame", 50, 100)
        player:draw()
    end
end
