-- par défaut le jeux est a 30 fps
import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics
local cercleRayon = 10

playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps

function playdate.update() -- se lance a chaque frame
	
	cercleRayon += 1
	gfx.fillCircleAtPoint(200, 120, cercleRayon)
	playdate.drawFPS(0,0)
end