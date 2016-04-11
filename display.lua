local Display = {}

local TicTacToe = require("ticTacToe")
local utils = require("utils")

local w = love.graphics.getWidth() -- largeur de l'écran
local h = love.graphics.getHeight() -- hauteur de l'écran

local cw, ch, lsize = 200, 200, 1 -- largeur case, hauteur case, largeur ligne

local mx, my = (w-3*(cw+lsize))/2, (h-3*(ch+lsize))/2 -- nouvelles coordonnées du repere
local lw, lh = 3*cw+2*lsize, 3*ch+2*lsize  -- longueur des lignes verticales et horizontales

local symbol = utils.set{'O', 'X'} -- O.png, X.png
local symbolImg = {}

--[[


   200     200     200
		|		|		
		|		|		200
 -------|-------|-------
		|		|		
		|		|		200
 -------|-------|-------
		|		|		
		|		|		200


--]]

-- -----------------------------------------------------------------------------

function Display:new(ttt)
        newObj = {
			ticTacToe = ttt
        }

		symbolImg['O'] = love.graphics.newImage("drawing/O.png")
		symbolImg['X'] = love.graphics.newImage("drawing/X.png")
		
        self.__index = self
        return setmetatable(newObj, self)
end

-- -----------------------------------------------------------------------------

function Display:draw()
	love.graphics.translate(mx, my) -- changer le repere pour centrer la grille
	-- Affichage de la grille
	love.graphics.line(cw,0, cw, lw)
	love.graphics.line(cw*2+lsize, 0, cw*2+lsize, lw)

	love.graphics.line(0, ch, lh, ch)
	love.graphics.line(0, ch*2+lsize, lh, ch*2+lsize)
	
	-- Affichage du contenu de la grille
	for i=1,3 do
		for j=1,3 do
			if symbol[self.ticTacToe.board[j][i]] then -- on draw si le symbol est correct (ou non nul)
				love.graphics.draw(symbolImg[self.ticTacToe.board[j][i]], (i-1)*(lsize+cw) , (j-1)*(lsize+ch))
			end
		end
	end

end

-- -----------------------------------------------------------------------------
-- return la case cliqué
-- x : coordonnée X à l'écran
-- y : coordonnée Y à l'écran
function Display:where(x,y)
	return 1+math.floor((x-mx)/(cw+lsize)), 1+math.floor((y-my)/(ch+lsize))
end

-- -----------------------------------------------------------------------------

return Display

