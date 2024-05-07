-- par défaut le jeux est a 30 fps
import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "Bouton"
import "Menu"
-- import "images/normal"
-- import "images/press"
-- import "images/select"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	local menuTest = Menu()
end

initialize()

function playdate.update() -- se lance a chaque frame
	gfx.sprite.update()
	playdate.drawFPS(0,0)
end