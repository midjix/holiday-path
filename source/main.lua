-- par défaut le jeux est a 30 fps
import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "Menu"
import "Plateau"


local pd <const> = playdate
local gfx <const> = pd.graphics
local tmr <const> = pd.timer

local function initialize()
	 menu = Menu()
	 plateau = Plateau()
	 
end

local function voirMenu()
	local gameOver = plateau:isGameOver()
	if gameOver then
		menu.estVisible = true
	end
end

local function voirPateaux(menuEstVisible) 
	if not(menu.estVisible) then
		print("le plateau est visible")
	end
end

initialize()



function playdate.update() -- se lance a chaque frame
	voirMenu() -- permet de revoir le menu une fois la partie terminer
	voirPateaux() 
	menu:update()	-- met à jour le menu a chaque nouvelle image
	playdate.drawFPS(0,0)
end