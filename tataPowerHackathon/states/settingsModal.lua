-- settingsModal.lua
-- This module handles the modal for settings

local settingsModal = {}

local modalText = ""
local showModal = false

-- Modal properties
local modalWidth = 700
local modalHeight = 450
local modalX = 600
local modalY = 250
local cornerRadius = 10

function settingsModal.showSettings()
    modalText = "Here are the game settings:\n\n[Insert your settings here]"
    showModal = true
end

function settingsModal.draw()
    if showModal then
        -- Draw the modal background with rounded corners
        love.graphics.setColor(255, 255, 255) -- White background
        love.graphics.rectangle("fill", modalX, modalY, modalWidth, modalHeight, cornerRadius, cornerRadius)

        -- Draw the modal heading
        love.graphics.setColor(0, 0, 0) -- Black text color
        love.graphics.setFont(love.graphics.newFont(18))
        local headingText = "Settings"
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

        -- Draw the close button (an "X" symbol)
        love.graphics.setColor(255, 0, 0) -- Red color for the button
        love.graphics.line(modalX + modalWidth - 20, modalY + 10, modalX + modalWidth - 10, modalY + 20)
        love.graphics.line(modalX + modalWidth - 10, modalY + 10, modalX + modalWidth - 20, modalY + 20)
    end
end

return settingsModal
