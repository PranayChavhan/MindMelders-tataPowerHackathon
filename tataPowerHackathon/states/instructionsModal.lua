-- instructionsModal.lua
-- This module handles the modal for instructions

local instructionsModal = {}

local modalText = ""
local showModal = false

function instructionsModal.showInstructions()
    modalText = "Here are the game instructions:\n\n[Insert your instructions here]"
    showModal = true
end

function instructionsModal.draw()
    if showModal then
        love.graphics.setColor(0, 0, 0, 200) -- Semi-transparent background
        love.graphics.rectangle("fill", 100, 100, love.graphics.getWidth() - 200, love.graphics.getHeight() - 200)
        love.graphics.setColor(255, 255, 255)
        -- love.graphics.setFont(buttonFont)
        love.graphics.printf(modalText, 120, 120, love.graphics.getWidth() - 240, "center")
    end
end

return instructionsModal
