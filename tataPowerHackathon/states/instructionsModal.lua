-- instructionsModal.lua
-- This module handles the modal for Instructions

local instructionsModal = {}

local modalText = ""
local showModal = false
local closeButtonActive = false

-- Modal properties
local modalWidth = 700
local modalHeight = 450
local modalX = 600
local modalY = 250
local cornerRadius = 10

-- Close button properties
local closeButtonX = modalX + modalWidth - 40
local closeButtonY = modalY + 10
local closeButtonWidth = 30
local closeButtonHeight = 30

function instructionsModal.showInstructions()
    modalText = "[Insert your instructions here]"
    showModal = true
    closeButtonActive = true
end

function instructionsModal.draw()
    if showModal then
        -- Draw the modal background with rounded corners
        love.graphics.setColor(255, 255, 255) -- White background
        love.graphics.rectangle("fill", modalX, modalY, modalWidth, modalHeight, cornerRadius, cornerRadius)

        -- Draw the modal heading
        love.graphics.setColor(0, 0, 0) -- Black text color
        love.graphics.setFont(love.graphics.newFont(18))
        local headingText = "Instructions"
        local textWidth = love.graphics.getFont():getWidth(headingText)
        local textX = modalX + (modalWidth - textWidth) / 2
        local textY = modalY + 20
        love.graphics.print(headingText, textX, textY)

        -- Draw the modal content
        love.graphics.setColor(0, 0, 0) -- Black text color
        love.graphics.setFont(love.graphics.newFont(14))
        textWidth = love.graphics.getFont():getWidth(modalText)
        textX = modalX + (modalWidth - textWidth) / 2
        textY = modalY + 60
        love.graphics.printf(modalText, textX, textY, modalWidth - 40, "left")

        -- Check if the mouse is over the close button
        local isOverCloseButton = love.mouse.getX() >= closeButtonX and love.mouse.getX() <= closeButtonX + closeButtonWidth
            and love.mouse.getY() >= closeButtonY and love.mouse.getY() <= closeButtonY + closeButtonHeight

        -- Draw the close button as a clickable button
        if isOverCloseButton then
            love.mouse.setCursor(love.mouse.getSystemCursor("hand"))
            
        else
            love.mouse.setCursor()
            love.graphics.setColor(255, 0, 0) -- Red color for the button
        end

        love.graphics.rectangle("fill", closeButtonX, closeButtonY, closeButtonWidth, closeButtonHeight, 5, 5)

        -- Draw the "X" symbol in white for the close button
        love.graphics.setColor(255, 255, 255) -- White color for the symbol
        love.graphics.line(closeButtonX + 5, closeButtonY + 5, closeButtonX + closeButtonWidth - 5, closeButtonY + closeButtonHeight - 5)
        love.graphics.line(closeButtonX + 5, closeButtonY + closeButtonHeight - 5, closeButtonX + closeButtonWidth - 5, closeButtonY + 5)

        -- Check if the close button is clicked
        if isOverCloseButton and love.mouse.isDown(1) then
            showModal = false
        end
    end
end

return instructionsModal
