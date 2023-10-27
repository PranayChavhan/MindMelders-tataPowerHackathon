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
local buttonSpacing = 20
local buttonX = (love.graphics.getWidth() - buttonWidth) / 2
local startY = (love.graphics.getHeight() - (3 * buttonHeight + 2 * buttonSpacing)) / 2

local buttons = {
    { text = "Start Game", action = "start" },
    { text = "Exit Game", action = "exit" },
    { text = "Instructions", action = "instructions" },
    { text = "Settings", action = "settings" }
}

local cornerRadius = 10
local cursorChanged = false

function startgame.draw()
    -- Draw the darkened background image
    love.graphics.setColor(100, 100, 100)
    love.graphics.draw(background, 0, 0, 0, love.graphics.getWidth() / background:getWidth(), love.graphics.getHeight() / background:getHeight())

    cursorChanged = false -- Reset cursor change

    for i, button in ipairs(buttons) do
        local buttonY = startY + (i - 1) * (buttonHeight + buttonSpacing)
        
        -- Check if the mouse is over the button
        local mouseX, mouseY = love.mouse.getPosition()
        if mouseX >= buttonX and mouseX <= buttonX + buttonWidth and
           mouseY >= buttonY and mouseY <= buttonY + buttonHeight then
            -- Set cursor pointer
            love.mouse.setCursor(love.mouse.getSystemCursor("hand"))
            cursorChanged = true
        end

        -- Set the green background color for each button
        local buttonColor = {0, 255, 0}
        love.graphics.setColor(buttonColor)
        love.graphics.rectangle("fill", buttonX, buttonY, buttonWidth, buttonHeight, cornerRadius, cornerRadius)

        -- Draw the button text in the center
        local textWidth = buttonFont:getWidth(button.text)
        local textX = buttonX + (buttonWidth - textWidth) / 2
        local textY = buttonY + (buttonHeight - buttonFont:getHeight()) / 2
        love.graphics.setColor(255, 255, 255)
        love.graphics.setFont(buttonFont)
        love.graphics.print(button.text, textX, textY)
    end

    -- Reset the cursor if it was not changed
    if not cursorChanged then
        love.mouse.setCursor()
    end
end

return startgame
