require('board')
require('patterns/patterns')
--require('cells/gameoflife')
--require('cells/highlife')
--require('cells/rule30')
require('cells/rule54')

function love.load()
	iterate_timer = 0.2
	lovebird = require('libs/lovebird')
	board = Board:new(R54)
	patterns = Patterns:new()
	pause = true

	pattern_message = ""
end

function love.update(dt)

	iterate_timer = iterate_timer - dt
	if iterate_timer <= 0 then
		if pause == false then
			board:iterate()
		end
		local leftover = math.abs(iterate_timer)
		iterate_timer = 0.2 - leftover
	end

	lovebird.update()
end

function love.draw()
    board:draw()
    love.graphics.print( pattern_message, 50, 50 )
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
		patterns:paste (board, x, y)
	end

	pattern_message = patterns:change (button)
end