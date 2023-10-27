--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

MainMenu = Class {
    __includes = BaseState
}

-- Add this at the top of your file to load the background image
local background = love.graphics.newImage("assets/images/bg.jpg")

-- whether we're highlighting "Start" or "High Scores"
local highlighted = 1

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

    love.graphics.setFont(love.graphics.newFont("assets/fonts/EncodeSansSemiCondensed-Black.ttf", 50))
    love.graphics.setColor(1, 0.3, 0.9)
    love.graphics.printf("Eco City", 0, VIRTUAL_HEIGHT / 2 + 50 - 250, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1)

    love.graphics.setFont(love.graphics.newFont("assets/fonts/EncodeSansSemiCondensed-Black.ttf", 30))
    if highlighted == 1 then
        love.graphics.setColor(103 / 255, 1, 1, 1)
    end
    love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 50 - 50, VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)

    -- render option 2 blue if we're highlighting that one
    if highlighted == 2 then
        love.graphics.setColor(103 / 255, 1, 1, 1)
    end
    love.graphics.printf("INSTRUCTIONS", 0, VIRTUAL_HEIGHT / 2 + 150 - 50, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(1, 1, 1, 1)
    if highlighted == 3 then
        love.graphics.setColor(103 / 255, 1, 1, 1)
    end
    love.graphics.printf("CREDITS", 0, VIRTUAL_HEIGHT / 2 + 250 - 50, VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)

    if highlighted == 4 then
        love.graphics.setColor(103 / 255, 1, 1, 1)
    end

    love.graphics.printf("EXIT", 0, VIRTUAL_HEIGHT / 2 + 350 - 50, VIRTUAL_WIDTH, 'center')

    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)
end
