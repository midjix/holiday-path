import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Plateau').extends(gfx.sprite)

function Plateau:init()
    Plateau.super.init(self)
end

function Plateau:isGameOver() -- simule la fin du jeux
    local gameOver = false
    if pd.buttonJustPressed(pd.kButtonB) then
        gameOver = true
	end
    return gameOver
end

function Plateau:update(menuEstVisible)
    
end