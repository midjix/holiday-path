-- ce menu ne peut avoir que 9 boutons par ligne !!!
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

	self.boutons = {} --tableau de boutons
	self.boutons[1] = {}
	
    self.boutons[1*10 + 1] = Bouton(200, 120, "images/normal", "images/select", "images/press") -- Bouton play
	self.boutons[1*10 + 1].etat = 0
	self.boutons[2*10 + 1] = Bouton(133, 180, "images/normal", "images/select", "images/press") -- Bouton Crédit
	self.boutons[2*10 + 1].etat = 0
	self.boutons[2*10 + 2] = Bouton(266, 180, "images/normal", "images/select", "images/press") -- Bonton règle
	self.boutons[2*10 + 2].etat = 0

	self.boutonSelect = {1, 1} -- Enregistre les indices du bouton selectionné 
	
    self:add()
end

function Menu:selection()
	self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2]].etat = 0 -- change l'etat de l'encien boutons selectionné à Normal
	
	-- selectionne le bonton de gauche si le bonton exist
	if pd.buttonIsPressed(pd.kButtonLeft) then
		if   self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2] - 1] ~= nil then
			self.boutonSelect[2] -= 1 
		end
	end

	-- selectionne le bonton de droit si le bonton exist
	if pd.buttonIsPressed(pd.kButtonRight) then
		if  self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2] + 1] ~= nil then
			self.boutonSelect[2] += 1 
		end
	end

	-- selectionne le bonton du haut si le bonton exist
	if pd.buttonIsPressed(pd.kButtonUp) then
		if self.boutons[(self.boutonSelect[1] - 1)*10 + self.boutonSelect[2]] ~= nil then
			self.boutonSelect[1] -= 1 
		end
	end

	-- selectionne le bonton du bas si le bonton exist
	if pd.buttonIsPressed(pd.kButtonDown) then
		if self.boutons[(self.boutonSelect[1] + 1)*10 + self.boutonSelect[2]] ~= nil then
			self.boutonSelect[1] += 1 
		end
	end
	print(self.boutonSelect[1].." "..self.boutonSelect[2])
	self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2]].etat = 1 -- change l'etat du nouveau boutons selectionné à Select
end

function Menu:presserBouton()
   if pd.buttonIsPressed(pd.kButtonA) then
	self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2]].etat = 2
   end
end

function Menu:update()
    Menu.super.update(self)
    self:selection()
    self:presserBouton()
end