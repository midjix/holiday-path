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
    self.boutons[1*10 + 1] = Bouton(133, 120, "images/PLAY neutre", "images/PLAY Select", "images/PLAY press") -- Bouton Play
	self.boutons[1*10 + 1].etat = 0
	self.boutons[1*10 + 2] = Bouton(266, 120, "images/EXIT neutre", "images/EXIT Select", "images/EXIT press") -- Bouton Exit
	self.boutons[1*10 + 2].etat = 0
	self.boutons[2*10 + 1] = Bouton(70, 220, "images/normal", "images/select", "images/press") -- Bouton Crédit
	self.boutons[2*10 + 1].etat = 0
	self.boutons[2*10 + 2] = Bouton(330, 220, "images/normal", "images/select", "images/press") -- Bonton Règle
	self.boutons[2*10 + 2].etat = 0
	self.boutonSelect = {1, 1} -- Enregistre les indices du bouton selectionné 
	self.estVisible = true
    self:add()
end

function Menu:selection()
	self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2]].etat = 0 -- change l'etat de l'encien boutons selectionné à Normal
	
	-- selectionne le bonton de gauche si le bonton exist
	if pd.buttonJustPressed(pd.kButtonLeft) then
		if   self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2] - 1] ~= nil then
			self.boutonSelect[2] -= 1 
		end
	end

	-- selectionne le bonton de droit si le bonton exist
	if pd.buttonJustPressed(pd.kButtonRight) then
		if  self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2] + 1] ~= nil then
			self.boutonSelect[2] += 1 
		end
	end

	-- selectionne le bonton du haut si le bonton exist
	if pd.buttonJustPressed(pd.kButtonUp) then
		if self.boutons[(self.boutonSelect[1] - 1)*10 + self.boutonSelect[2]] ~= nil then
			self.boutonSelect[1] -= 1 
			print(self.boutonSelect[1].." "..self.boutonSelect[2])
		end
	end

	-- selectionne le bonton du bas si le bonton exist
	if pd.buttonJustPressed(pd.kButtonDown) then
		if self.boutons[(self.boutonSelect[1] + 1)*10 + self.boutonSelect[2]] ~= nil then
			self.boutonSelect[1] += 1 
			print(self.boutonSelect[1].." "..self.boutonSelect[2])
		end
	end
	
	self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2]].etat = 1 -- change l'etat du nouveau boutons selectionné à Select
end

function Menu:presserBouton()
	local boutonSelect = self.boutons[self.boutonSelect[1]*10 + self.boutonSelect[2]]

	if pd.buttonIsPressed(pd.kButtonA) then
		boutonSelect.etat = 2 -- l'apparence du bouton change pour l'apparence "select"
	end

	if pd.buttonJustReleased(pd.kButtonA) then
		-- Action du bouton Play
		if boutonSelect == self.boutons[1*10 + 1] then 
			self.estVisible = false
			gfx.clear()
		
		elseif boutonSelect == self.boutons[1*10 + 2] then
			
		end


	end
end

function Menu:update() 
	if self.estVisible then
		for k in pairs(self.boutons) do -- update chaque bouton à chaque update du menu visible
			if self.boutons[k] ~= nil then
				self.boutons[k]:update()
			end
		end	
		self:selection()
    	self:presserBouton()
	end
end