-- par défaut le jeux est a 30 fps
import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "Bouton"
import "images/normal"
import "images/press"
import "images/select"

local pd <const> = playdate
local gfx <const> = pd.graphics


playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps

function playdate.update() -- se lance a chaque frame
	local bontonTest = Bouton(200, 120, "images/normal", "images/press", "images/select")
	if pd.buttonIsPressed(pd.kButtonA) then
		bontonTest:update(1)	
	end
	if pd.buttonIsPressed(pd.kButtonB) then
		bontonTest:update(2)		
	end
	playdate.drawFPS(0,0)
end