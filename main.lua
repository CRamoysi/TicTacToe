love.graphics.setDefaultFilter("nearest") -- set le filtre d'affichage par defaut des images


local Display = require("display")
local TicTacToe = require("ticTacToe")
local Win = require("win")

local ttt = nil
local display = nil
local winScreen = nil

local winner = false

-- =============================================================================

function love.load()
	ttt = TicTacToe:new()
	display = Display:new(ttt)
	winScreen = Win:new()	
end

-- =============================================================================

function love.update(delta_time)
	
end

-- =============================================================================

function love.draw()
	if winner == false then
		display:draw()
	else
		winScreen:draw()
	end
end

-- =============================================================================

function love.mousepressed(x, y, button, istouch)
	if winner ~= false then -- On a un gagnant
		love.load()
		winner = false
		return
	end
	local x,y = display:where(x,y)
	if x ~= 0 and y ~= 0 then -- Un coup est joué
		ttt:add(x, y)
		winner = ttt:check()
		if winner ~= false then -- on a un gagnant, on change d'écran
			love.graphics.discard()
			winScreen:set(winner)
		end
	end
	
end

-- Gestion du clavier
function love.keypressed(key)
	if key == "escape" then -- pour quitter (mieux qu'un bouton quitter mageul !)
		love.event.quit()
	end
end
