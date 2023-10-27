-- Import required modules
local love = require("love")

-- Initialize level-specific variables
local level1 = {
    player = {
        x = 100,  -- Initial player position
        y = 100,
        width = 32,  -- Player width
        height = 32, -- Player height
        speed = 200  -- Player movement speed
    },
    closeButtonText = "Close", -- Text for the close button
    closeButton = {
        x = 720, -- Position of the close button
        y = 10,
        width = 70, -- Button dimensions
        height = 30
    }
}

function level1.load()
    -- Load level-specific assets and set up the environment
    -- Load background image
    level1.background = love.graphics.newImage("assets/images/level1_background.jpg")
    
    -- Load the player image (you should specify the path to the player image)
    level1.player.image = love.graphics.newImage("assets/images/player.png")
end

function level1.update(dt)
    -- Handle player movement
    if love.keyboard.isDown("up") then
        level1.player.y = level1.player.y - level1.player.speed * dt
    end
    if love.keyboard.isDown("down") then
        level1.player.y = level1.player.y + level1.player.speed * dt
    end
    if love.keyboard.isDown("left") then
        level1.player.x = level1.player.x - level1.player.speed * dt
    end
    if love.keyboard.isDown("right") then
        level1.player.x = level1.player.x + level1.player.speed * dt
    end

    -- Check if the close button is clicked
    if love.mouse.isDown(1) then -- 1 represents the left mouse button
        local mouseX, mouseY = love.mouse.getPosition()
        if mouseX >= level1.closeButton.x and mouseX <= level1.closeButton.x + level1.closeButton.width and
           mouseY >= level1.closeButton.y and mouseY <= level1.closeButton.y + level1.closeButton.height then
            love.event.quit() -- Close the game when the close button is clicked
        end
    end
end

function level1.draw()
    -- Draw the level environment, player, and the close button (text)
    love.graphics.draw(level1.background, 0, 0)

    -- Draw the close button (text)
    love.graphics.setColor(0, 0, 0) -- Set text color to black
    love.graphics.rectangle("fill", level1.closeButton.x, level1.closeButton.y, level1.closeButton.width, level1.closeButton.height)
    love.graphics.setColor(255, 255, 255) -- Reset text color to white
    love.graphics.print(level1.closeButtonText, level1.closeButton.x + 10, level1.closeButton.y + 5)

    -- Draw the player image with the specified width and height
    love.graphics.draw(level1.player.image, level1.player.x, level1.player.y, 0, level1.player.width / 32, level1.player.height / 32)
end

return level1
