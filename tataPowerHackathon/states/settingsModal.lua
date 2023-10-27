-- settingsModal.lua
-- This module handles the modal for settings

local settingsModal = {}

local modalText = ""
local showModal = false

function settingsModal.showSettings()
    modalText = "Here are the game settings:\n\n[Insert your settings here]"
    showModal = true
end

function settingsModal.draw()
    if showModal then
        love.graphics.setColor(0, 0, 0, 200) -- Semi-transparent background
        love.graphics.rectangle("fill", 100, 100, love.graphics.getWidth() - 200, love.graphics.getHeight() - 200)
        love.graphics.setColor(255, 255, 255)
        -- love.graphics.setFont(buttonFont)
        love.graphics.printf(modalText, 120, 120, love.graphics.getWidth() - 240, "center")
    end
end

return settingsModal
