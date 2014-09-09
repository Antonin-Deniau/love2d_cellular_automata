require('gol')

function love.load()
	iterate_timer = 1
	lovebird = require('lovebird')
	gol = Gol:new()
	pause = true
end

function love.update(dt)

	iterate_timer = iterate_timer - dt
	if iterate_timer <= 0 then
		if pause == false then
			gol:iterate()
		end
		local leftover = math.abs(iterate_timer)
		iterate_timer = 1 - leftover
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