PlayState = Class {
    __includes = BaseState
}
platforms = {}

function PlayState:init()

    --self.image = love.graphics.newImage('sprites/credits.jpg')
    self.player = Player()
    self.mill = Windmill()
    self:loadMap()
end

function PlayState:update(dt)

    world:update(dt)
    gameMap:update(dt)
    self.player:update(dt)
    self.mill:update(dt)

    if love.keyboard.wasPressed('return') then
        gStateStack:pop()
        gStateStack:push(MainMenu())
    end

end

function PlayState:render()
    cam:attach()
    world:draw()
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Play State",100,100)
    gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
    gameMap:drawLayer(gameMap.layers["Tile Layer 2"])
    self.player:render()
    self.mill:render()
    cam:detach()
    --love.graphics.draw(self.image, 0, 0)

end

function PlayState:loadMap()
    gameMap = sti("maps/Game.lua")

    for i, obj in pairs(gameMap.layers["buildings_obj"].objects) do
        self:spawnPlatform(obj.x, obj.y, obj.width, obj.height)
    end
    for i, obj in pairs(gameMap.layers["chairs"].objects) do
        self:spawnChairs(obj.x, obj.y, obj.width, obj.height)
    end
    for i, obj in pairs(gameMap.layers["water_Dam"].objects) do
        self:spawnPlatform(obj.x, obj.y, obj.width, obj.height)
    end
    for i, obj in pairs(gameMap.layers["windmill"].objects) do
        self:spawnWindmill(obj.x, obj.y, obj.width, obj.height)
    end
end

function PlayState:spawnPlatform(x, y, width, height)
    local pp = world:newRectangleCollider(x, y, width, height, {
        collision_class = "Platform"
    })
    pp:setType('static')
    table.insert(platforms, pp)
end

function PlayState:spawnChairs(x, y, width, height)
    local pp = world:newRectangleCollider(x, y, width, height, {
        collision_class = "Chair"
    })
    pp:setType('static')
    table.insert(platforms, pp)
end

function PlayState:spawnDam(x, y, width, height)
    local pp = world:newRectangleCollider(x, y, width, height, {
        collision_class = "Dam"
    })
    pp:setType('static')
    table.insert(platforms, pp)
end

function PlayState:spawnWindmill(x, y, width, height)
    local pp = world:newRectangleCollider(x, y, width, height, {
        collision_class = "Windmill"
    })
    pp:setType('static')
    table.insert(platforms, pp)
end
