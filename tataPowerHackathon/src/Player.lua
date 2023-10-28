Player = Class {
    __includes = BaseState
}

function Player:init()
    self.player = world:newRectangleCollider(1570, 35, 10, 10,{collision_class="Player"})
    self.player.speed=180
    self.player:setFixedRotation(true)
    self.player.isMoving = false
    self.player.direction = 1

    self.player.spritesheet = love.graphics.newImage('sprites/player_spritesheet.png')
    self.player.grid = anim8.newGrid(16, 16, self.player.spritesheet:getWidth(), self.player.spritesheet:getHeight())
    self.player.animation = {}
    self.player.animation.up = anim8.newAnimation(self.player.grid('1-3', 1), 0.1)
    self.player.animation.left = anim8.newAnimation(self.player.grid('1-3', 2), 0.1)
    self.player.animation.right = anim8.newAnimation(self.player.grid('1-3', 3), 0.1)
    self.player.animation.down = anim8.newAnimation(self.player.grid('1-3', 4), 0.1)

    self.player.anim = self.player.animation.left
end

function Player:update(dt)
    local px, py = self.player:getX(),self.player:getY()
    isMoving = false
    cam:lookAt(px,py)
    if love.keyboard.isDown("right") then
        self.player:setX(self.player:getX() + self.player.speed*dt)
        self.player.anim = self.player.animation.right
        isMoving = true
    end
    if love.keyboard.isDown("left") then
        self.player:setX(self.player:getX() - self.player.speed*dt)
        self.player.anim = self.player.animation.left
        isMoving = true
    end
    if love.keyboard.isDown("up") then
        self.player:setY(self.player:getY() - self.player.speed*dt)
        self.player.anim = self.player.animation.down
        isMoving = true
    end
    if love.keyboard.isDown("down") then
        self.player:setY(self.player:getY() + self.player.speed*dt)
        self.player.anim = self.player.animation.up
        isMoving = true
    end

    if isMoving == false then
        self.player.anim:gotoFrame(2)
    end

    if fixedWindmill == false and checkCollision(px, py, 10, 10, 440, 1570, 100, 30) then
        glevel = 2
        gStateStack:push(DialogueState())
        self.player:setX(70)
        self.player:setY(1610)
    end
    if fixedHydro == false and checkCollision(px, py, 10, 10, 1700, 177, 170, 60) then
        glevel = 3
        gStateStack:push(DialogueState())
        self.player:setX(70)
        self.player:setY(1610)
    end
    if fixedSolar1 == false and checkCollision(px, py, 10, 10, 1136, 1519, 100, 50) then
        glevel = 4
        gStateStack:push(DialogueState())
        fixedSolar1 = true
        self.player:setX(70)
        self.player:setY(1610)
    end

    if fixedSolar2 == false and checkCollision(px, py, 10, 10, 375, 13, 120, 30) then
        glevel = 4
        gStateStack:push(DialogueState())
        fixedSolar2 = true
        self.player:setX(70)
        self.player:setY(1610)
    end

    self.player.anim:update(dt)
 
end




function Player:render()
--    love.graphics.rectangle('fill', self.player:getX() - 8, self.player:getY() - 8, 16, 16)
self.player.anim:draw(self.player.spritesheet,self.player:getX() - 10, self.player:getY() - 10, nil, 1.3, 1.3)
-- print(glevel)
   
end
