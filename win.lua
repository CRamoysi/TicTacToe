local Win = {}


local w = love.graphics.getWidth() -- largeur de l'écran
local h = love.graphics.getHeight() -- hauteur de l'écran

local symbolImg = {}

function Win:new()
        newObj = {
			winner = nil
        }

		symbolImg['O'] = love.graphics.newImage("drawing/O.png")
		symbolImg['X'] = love.graphics.newImage("drawing/X.png")
		symbolImg['-'] = love.graphics.newImage("drawing/draw.png")
		
        self.__index = self
        return setmetatable(newObj, self)
end

function Win:draw()
	love.graphics.draw(symbolImg[self.winner],w/2-symbolImg[self.winner]:getWidth(),h/2-symbolImg[self.winner]:getHeight(), 0, 2, 2)	
end

function Win:set(winner)
	self.winner = winner
end


return Win
