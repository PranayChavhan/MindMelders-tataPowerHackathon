-- Import required modules
local love = require("love")

local startgame = {}

-- Load the background image
local background = love.graphics.newImage("assets/images/bg.jpg")

-- Load the bold font
local buttonFont = love.graphics.newFont("assets/fonts/EncodeSansSemiCondensed-Black.ttf", 24)

-- Button properties
local buttonWidth = 200
local buttonHeight = 60
local buttonX = (love.graphics.getWidth() - buttonWidth) / 2
local buttonY = (love.graphics.getHeight() - buttonHeight) / 2
local buttonText = "Start Game"
local buttonTextColor = {255, 255, 255}
local buttonColor = {200, 0, 0}
local shadowColor = {100, 0, 0}
local cornerRadius = 10

function startgame.draw()
    -- Draw the background image to fill the screen
    love.graphics.draw(background, 0, 0, 0, love.graphics.getWidth() / background:getWidth(), love.graphics.getHeight() / background:getHeight())

    -- Draw the button with rounded corners and a shadow
    love.graphics.setColor(shadowColor)
    love.graphics.rectangle("fill", buttonX + 10, buttonY + 10, buttonWidth, buttonHeight, cornerRadius, cornerRadius)
    love.graphics.setColor(buttonColor)
    love.graphics.rectangle("fill", buttonX, buttonY, buttonWidth, buttonHeight, cornerRadius, cornerRadius)

    -- Draw the button text in the center
    local textWidth = buttonFont:getWidth(buttonText)
    local textX = buttonX + (buttonWidth - textWidth) / 2
    local textY = buttonY + (buttonHeight - buttonFont:getHeight()) / 2
    love.graphics.setColor(buttonTextColor)
    love.graphics.setFont(buttonFont)
    love.graphics.print(buttonText, textX, textY)
end

return startgame
