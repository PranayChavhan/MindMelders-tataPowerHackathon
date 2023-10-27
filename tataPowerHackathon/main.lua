local love = require("love")
local level1 = require("levels.level1")
local startgame = require("states.startgame")
local settingsModal = require("states.settingsModal")
local instructionsModal = require("states.instructionsModal")
local backgroundMusic

function love.load()
    love.window.setTitle("EcoCraft Challenge")
    local displayWidth, displayHeight = love.window.getDesktopDimensions()
    love.window.setMode(displayWidth, displayHeight, {fullscreen = false})

    backgroundMusic = love.audio.newSource("assets/sounds/bg.mp3", "stream")
    backgroundMusic:setVolume(0.5)
    backgroundMusic:setLooping(true)
end

function love.update(dt)

end

local currentScreen = "start"
function switchScreen(screenName)
    currentScreen = screenName
end

function love.draw()
    if currentScreen == "start" then
        startgame.draw()
        settingsModal.draw() 
        instructionsModal.draw() 
    elseif currentScreen == "level1" then
        level1.draw()
    end

    backgroundMusic:play()
end

function love.quit()
    backgroundMusic:stop()
    backgroundMusic:release()
end
