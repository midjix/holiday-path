import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "Bouton"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Menu').extends(gfx.sprite)

function Menu:init()
    Menu.super.init(self)
    self.bontonTest1 = Bouton(100, 120, "images/normal", "images/select", "images/press")
	self.bontonTest1.etat = 1
	self.bontonTest2 = Bouton(300, 120, "images/normal", "images/select", "images/press")
    self:add()
end

function Menu:selection()
	if pd.buttonIsPressed(pd.kButtonLeft) then
        self.bontonTest1.etat = 1
		self.bontonTest2.etat = 0
	end
	if pd.buttonIsPressed(pd.kButtonRight) then
		self.bontonTest1.etat = 0
		self.bontonTest2.etat = 1
	end
end

function Menu:presserBouton()
    if self.bontonTest1.etat == 1 and pd.buttonIsPressed(pd.kButtonA) then
        self.bontonTest1.etat = 2
	end

	if self.bontonTest2.etat == 1 and pd.buttonIsPressed(pd.kButtonA) then
        self.bontonTest2.etat = 2
	end
    
end

function Menu:update()
    Menu.super.update(self)
    self:selection()
    self:presserBouton()
end