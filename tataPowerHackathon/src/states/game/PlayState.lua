PlayState = Class {
    __includes = BaseState,
    bgMusic = love.audio.newSource("assets/sounds/playstate.mp3", "stream")
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

    -- Call the function to start the background music
    self:startBackgroundMusic()
end

function PlayState:startBackgroundMusic()
    -- Set the volume for the background music (between 0 and 1)
    self.bgMusic:setVolume(0.5)

    -- Set the background music to loop
    self.bgMusic:setLooping(true)

    -- Start playing the background music
    love.audio.play(self.bgMusic)
end

function PlayState:stopBackgroundMusic()
    -- Stop the background music
    love.audio.stop(self.bgMusic)
end




function PlayState:update(dt)

    world:update(dt)
    gameMap:update(dt)
    self.player:update(dt)
    self.mill:update(dt)

    if love.keyboard.wasPressed('return') then
        gStateStack:pop()
        gStateStack:push(MainMenu())

        -- Stop the background music when transitioning to a different state
        self:stopBackgroundMusic()
    end
    print(gtasks)
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
