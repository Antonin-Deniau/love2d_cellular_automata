require('gol')

function love.load()
	lovebird = require('lovebird')
	gol = Gol:new()
	pause = true
end

function love.update()
	if pause == false then
		gol:iterate()
	end

	lovebird.update()

	if love.mouse.isDown("l") then
		local x = love.mouse.getX()
		local y = love.mouse.getY()
        gol:add_true(x, y)
    end
end

function love.draw()
    gol:draw()
end

function love.keypressed(key)
   if key == " " then
      if pause then
      	pause = false
      else
      	pause = true
      end
   end
end
