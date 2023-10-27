
require 'src/Dependencies'


function love.load()
    -- init -> screen generation--
    -- push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    --     fullscreen = false,
    --     vsync = true,
    --     resizable = true,
    -- })

    wf = require 'lib/windfield/windfield'
    world = wf.newWorld(0, 0, false)

    -- anim8 = require 'lib/anim8/anim8'

    sti = require 'lib/Simple-Tiled-Implementation/sti'
    cameraFile = require 'lib/hump/camera'

    world:setQueryDebugDrawing(true)
    world:addCollisionClass('Player')
    world:addCollisionClass('Platform')
    world:addCollisionClass('Chair')
    world:addCollisionClass('Dam')
    world:addCollisionClass('Windmill')

    love.window.setMode(VIRTUAL_WIDTH,VIRTUAL_HEIGHT)

    math.randomseed(os.time())
    print(os.time())

      -- keep track of keypressed
      cam =cameraFile()
    
    love.keyboard.keysPressed={}

    gStateStack = StateStack()
    gStateStack:push(MainMenu())
    cam:zoom(3.5)

   
end

function love.update(dt)
    gStateStack:update(dt)
    love.keyboard.keysPressed={}
end

-- function love.resize(w, h)
--     push:resize(w, h)
-- end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.draw()

    --push:start()
    --love.graphics.setColor(0.1,0.1,0.1)
    --love.graphics.rectangle("fill",0,0,VIRTUAL_WIDTH,VIRTUAL_HEIGHT)  
    gStateStack:render()
    --push:finish()

end 



