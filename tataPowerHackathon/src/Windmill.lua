Windmill = Class {
    __includes = BaseState
}

function Windmill:init()
    self.mill = world:newRectangleCollider(420, 1620, 10, 10)
    self.mill.image = love.graphics.newImage('sprites/windmill.png')
    self.mill:setType('static')
    -- self.mill.animation = {}
end

function Windmill:update(dt)

end

function Windmill:render()
    
    love.graphics.draw(self.mill.image, self.mill:getX(), self.mill:getY(), nil, 0.1)
end