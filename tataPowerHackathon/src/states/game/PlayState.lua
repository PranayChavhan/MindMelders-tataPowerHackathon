PlayState = Class {
    __includes = BaseState
}
platforms = {}
chairs = {}
dams = {}
windmills = {}

function PlayState:init()

    --self.image = love.graphics.newImage('sprites/credits.jpg')
    self.player = Player()
    self.mill = Windmill()
    self:loadMap()
    self.panelimage = love.graphics.newImage('sprites/Panel.png')
    self.background = love.graphics.newImage('sprites/background.jpeg')
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
    print(gtasks)

    -- if cam.x < VIRTUAL_WIDTH/2 then
    --     cam.x = VIRTUAL_WIDTH/2 - 255
    -- end

    -- if cam.y < WINDOW_HEIGHT/2 then
    --     cam.y = WINDOW_HEIGHT/2 - 255
    -- end

end

function PlayState:render()

    cam:attach()
    love.graphics.setLineWidth(2)
    love.graphics.draw(self.background, -1000,-1000,nil,50,50)
    
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Play State",100,100)
    gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
    gameMap:drawLayer(gameMap.layers["Tile Layer 2"])
    self.player:render()
    self.mill:render()
    -- love.graphics.rectangle('fill', 440, 1570, 100, 30)
    if fixedSolar2 == true then
        love.graphics.draw(self.panelimage, 300, 40, nil, 0.05)
        love.graphics.draw(self.panelimage, 480, 40, nil, 0.05)
    end

    if fixedSolar1 == true then
        love.graphics.draw(self.panelimage, 1046, 1260, nil, 0.05)
        love.graphics.draw(self.panelimage, 1231, 1260, nil, 0.05)
    end

    -- Hydro Coordinates 
    -- love.graphics.rectangle('fill', 1700, 177, 170, 60)
    world:draw()

    cam:detach()
    love.graphics.rectangle('line', 25, 25, 100 ,20)
    love.graphics.rectangle('fill', 25, 25, gtasks * 25,20)

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
    table.insert(chairs, pp)
end

function PlayState:spawnDam(x, y, width, height)
    local pp = world:newRectangleCollider(x, y, width, height, {
        collision_class = "Dam"
    })
    pp:setType('static')
    table.insert(dams, pp)
end

function PlayState:spawnWindmill(x, y, width, height)
    local pp = world:newRectangleCollider(x, y, width, height, {
        collision_class = "Windmill"
    })
    pp:setType('static')
    table.insert(windmills, pp)
end
