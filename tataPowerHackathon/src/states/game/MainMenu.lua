--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

MainMenu = Class {
    __includes = BaseState
}

-- whether we're highlighting "Start" or "High Scores"
local highlighted = 1

-- Load the background image
local background = love.graphics.newImage("assets/images/bg.jpg")

function MainMenu:init()
    counter_var = 1
    glevel = 1
end

function MainMenu:update(dt)
    -- toggle highlighted option if we press an arrow key up or down
    if love.keyboard.wasPressed('up') then
        if highlighted == 1 then
            highlighted = 5
        end
        highlighted = (highlighted - 1) % 5
    end

    if love.keyboard.wasPressed('down') then
        if highlighted == 4 then
            highlighted = 0
        end
        highlighted = (highlighted + 1) % 5
    end

    -- confirm whichever option we have selected to change screens
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if highlighted == 1 then
            gStateStack:pop()
            gStateStack:push(PlayState())
            gStateStack:push(DialogueState())
        elseif highlighted == 2 then
            gStateStack:pop()
            gStateStack:push(Instructions())
        elseif highlighted == 3 then
            gStateStack:pop()
            gStateStack:push(Credit())
        elseif highlighted == 4 then
            gStateStack:pop()
            gStateStack:push(End())
        end
    end
end

function MainMenu:render()
    -- Draw the background image
    love.graphics.draw(background, 0, 0, 0, VIRTUAL_WIDTH / background:getWidth(), VIRTUAL_HEIGHT / background:getHeight())

    -- Set the font for the title
    love.graphics.setFont(love.graphics.newFont("assets/fonts/EncodeSansSemiCondensed-Black.ttf", 50))
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Eco City", 0, VIRTUAL_HEIGHT / 2 + 50 - 250, VIRTUAL_WIDTH, 'center')

    -- Style for the buttons
    local buttonWidth = 250
    local buttonHeight = 60
    local buttonX = VIRTUAL_WIDTH / 2 - buttonWidth / 2
    local buttonY = VIRTUAL_HEIGHT / 2 - 50

    -- Set the button color to green
    love.graphics.setColor(0, 1, 0) -- Green button background color

    -- Draw "START" button
    love.graphics.rectangle('fill', buttonX, buttonY, buttonWidth, buttonHeight, 10, 10)

    -- Set the text color to white
    love.graphics.setColor(1, 1, 1) -- Text color
    love.graphics.setFont(love.graphics.newFont("assets/fonts/EncodeSansSemiCondensed-SemiBold.ttf", 30))
    love.graphics.printf("START", buttonX, buttonY + 15, buttonWidth, 'center')

    -- Draw "INSTRUCTIONS" button
    buttonY = buttonY + 100
    love.graphics.setColor(0, 1, 0) -- Green button background color
    love.graphics.rectangle('fill', buttonX, buttonY, buttonWidth, buttonHeight, 10, 10)
    love.graphics.setColor(1, 1, 1) -- Text color
    love.graphics.printf("INSTRUCTIONS", buttonX, buttonY + 15, buttonWidth, 'center')

    -- Draw "CREDITS" button
    buttonY = buttonY + 100
    love.graphics.setColor(0, 1, 0) -- Green button background color
    love.graphics.rectangle('fill', buttonX, buttonY, buttonWidth, buttonHeight, 10, 10)
    love.graphics.setColor(1, 1, 1) -- Text color
    love.graphics.printf("CREDITS", buttonX, buttonY + 15, buttonWidth, 'center')

    -- Draw "EXIT" button
    buttonY = buttonY + 100
    love.graphics.setColor(0, 1, 0) -- Green button background color
    love.graphics.rectangle('fill', buttonX, buttonY, buttonWidth, buttonHeight, 10, 10)
    love.graphics.setColor(1, 1, 1) -- Text color
    love.graphics.printf("EXIT", buttonX, buttonY + 15, buttonWidth, 'center')
end
