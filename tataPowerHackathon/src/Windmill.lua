Windmill = Class {
    __includes = BaseState
}

function Windmill:init()
    self.mill = world:newRectangleCollider(380, 1580, 10, 10)
    self.mill.image = love.graphics.newImage('sprites/windmill.png')
    self.mill:setType('static')
    -- self.player.grid = anim8.newGrid(16, 16, self.mill.spritesheet:getWidth(), self.mill.spritesheet:getHeight())
    -- self.mill.animation = {}
    -- self.mill.animation.rotating = anim8.newAnimation(self.player.grid('1-3', 1), 0.1)
end

function Windmill:update(dt)

end

function Windmill:render()
    for x = 1, 3 do
        for y = 1, 3 do
            love.graphics.draw(self.mill.image, self.mill:getX() + x*40, self.mill:getY() + y*60, nil, 0.1)
        end
    end
end