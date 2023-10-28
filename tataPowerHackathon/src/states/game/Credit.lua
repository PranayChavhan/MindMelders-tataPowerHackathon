Credit = Class {
    __includes = BaseState
}

function Credit:init()

    --self.image = love.graphics.newImage('sprites/credits.jpg')
    for _, body in pairs(world:getBodies()) do
        body:destroy()
    end
end

function Credit:update(dt)

    if love.keyboard.wasPressed('return') then
        gStateStack:pop()
        gStateStack:push(MainMenu())
    end

end

function Credit:render()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Credit State",100,100)
    --love.graphics.draw(self.image, 0, 0)

end
