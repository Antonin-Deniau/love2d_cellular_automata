require('board')
require('patterns/patterns')
require('cells/gameoflife')
require('cells/highlife')
require('cells/rule30')
require('cells/rule90')
require('cells/rule110')
require('cells/dayandnight')
require('cells/labilol')
require('cells/wireworld')

function love.load()
	lovebird = require('libs/lovebird')

	list_of_cell = {Gol, Hl, DNN, Labilol,  Rule30, Rule90, Rule110, WireWorld}

	list_of_name = {'Game of life' , 'Highlife' , 'Day and Night' , 'Labilol', 'Rule30','Rule90', 'Rule110','Wireworld' }

	current_cell = 1

	pause = true
	iterate_timer = 0.2
	pattern_message = ""

	board = Board:new(Gol)
	patterns = Patterns:new()
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
	love.graphics.setColor( 255,255,255)
    love.graphics.print( pattern_message, 5, 5 )
    love.graphics.print( list_of_name[current_cell] , 5, 20 )
end

function love.keypressed(key)
   if key == " " then
      if pause then
      	pause = false
      else
      	pause = true
      end
   end

   if key == "q" then
		if current_cell == #list_of_cell then
			current_cell = 1
		else
			current_cell = current_cell + 1
		end
		board:change_cell(list_of_cell[current_cell])
   end

   if key == "z" then
		if current_cell == 1 then
			current_cell = #list_of_cell
		else
			current_cell = current_cell - 1
		end
		board:change_cell(list_of_cell[current_cell])
   end
end

function love.mousepressed(x, y, button)
	if button == "l" then
		patterns:paste (board, x, y)
	end

	pattern_message = patterns:change (button)
end