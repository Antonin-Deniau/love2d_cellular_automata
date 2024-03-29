require('objs/board')
require('objs/patterns')
require('cells/gameoflife')
require('cells/highlife')
require('cells/rule30')
require('cells/rule90')
require('cells/rule110')
require('cells/dayandnight')
require('cells/maze')
require('cells/wireworld')
require('cells/amoeba')
require('cells/gnarl')
require('cells/replicator')
require('cells/serviettes')
require('cells/evoloop')

function love.load()
	lovebird = require('libs/lovebird')

	list_of_cell = { Gol,             Hl,          DNN,              Maze,   Rule30,  Rule90,   Rule110,  WireWorld,   Amoeba,   Gnarl,   Replicator,   Serviettes,   Evoloop  }
	list_of_name = {'Game of life' , 'Highlife' , 'Day and Night' , 'maze', 'Rule30','Rule90', 'Rule110','Wireworld', 'Amoeba', 'Gnarl', 'Replicator', 'Serviettes', 'Evoloop' }
	current_cell = 1

	board = Board:new(Gol)
	patterns = Patterns:new(Gol)

	pause = true
	pattern_message = ""
end

function love.update(dt)

	if pause == false then
		board:iterate()
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
		patterns:load(list_of_cell[current_cell])
   end

   if key == "z" then
		if current_cell == 1 then
			current_cell = #list_of_cell
		else
			current_cell = current_cell - 1
		end
		board:change_cell(list_of_cell[current_cell])
		patterns:load(list_of_cell[current_cell])
   end
end

function love.mousepressed(x, y, button)
	if button == "l" then
		patterns:paste (board, x, y)
	end

	pattern_message = patterns:change (button)
end