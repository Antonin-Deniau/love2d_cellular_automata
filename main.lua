require('gol')
require('patterns')


function love.load()
	iterate_timer = 0.2
	lovebird = require('lovebird')
	gol = Gol:new()
	patterns = Patterns:new()
	pause = true
end

function love.update(dt)

	iterate_timer = iterate_timer - dt
	if iterate_timer <= 0 then
		if pause == false then
			gol:iterate()
		end
		local leftover = math.abs(iterate_timer)
		iterate_timer = 0.2 - leftover
	end

	lovebird.update()
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

function love.mousepressed(x, y, button)
	if button == "l" then
		patterns:paste (gol, x, y)
	end

	patterns:change (button)
end