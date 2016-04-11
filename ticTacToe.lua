local TicTacToe = {}

local utils = require("utils")

local emptyValue = ' '

local player = {'O', 'X'}
local currentPlayer = 'O'

-- =============================================================================

function TicTacToe:new()
        newObj = {
			board = {{emptyValue,emptyValue,emptyValue},{emptyValue,emptyValue,emptyValue},{emptyValue,emptyValue,emptyValue}}
        }
        
        self.__index = self
        return setmetatable(newObj, self)
end

-- =============================================================================

-- [ligne][colonne]
function TicTacToe:add(x,y)
	if self.board[y][x] == emptyValue then
		self.board[y][x] = currentPlayer
		
		if currentPlayer == 'O' then currentPlayer = 'X'
		else currentPlayer = 'O'
		end
		
	end
end

-- =============================================================================

function TicTacToe:check()
	function mat()
		for i=1,3 do
			for j=1,3 do
				if self.board[i][j] == emptyValue then return false end
			end
		end
		return '-'
	end

	function checkLine(i)
		if self.board[i][1] ~= emptyValue and self.board[i][1] == self.board[i][2] and self.board[i][2] == self.board[i][3] then
			return self.board[i][1]
		else
			return false
		end
	end

	function checkColumn(i)
		if self.board[1][i] ~= emptyValue and self.board[1][i] == self.board[2][i] and self.board[2][i] == self.board[3][i] then
			return self.board[1][i]
		else
			return false
		end
	end

	function checkDiagonals()
		if self.board[1][1] ~= emptyValue and self.board[1][1] == self.board[2][2] and self.board[2][2] == self.board[3][3] then
			return self.board[1][1]
		elseif self.board[1][3] ~= emptyValue and self.board[1][3] == self.board[2][2] and self.board[2][2] == self.board[3][1] then
			return self.board[1][3]
		else
			return false
		end
	end
	
	function checkAllLines()
		return checkLine(1) or checkLine(2) or checkLine(3)
	end
	
	function checkAllColumns()
		return checkColumn(1) or checkColumn(2) or checkColumn(3)
	end
	
	return mat() or checkAllLines() or checkAllColumns() or checkDiagonals()
end

-- =============================================================================

function TicTacToe:debug()
	utils.print_r(self.board[1][1]..self.board[2][1]..self.board[3][1])
	utils.print_r(self.board[1][2]..self.board[2][2]..self.board[3][2])
	utils.print_r(self.board[1][3]..self.board[2][3]..self.board[3][3])
end

-- =============================================================================


return TicTacToe
