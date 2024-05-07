import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Bouton').extends(gfx.sprite)

function Bouton:init(x, y, imgNormal, imgSelect, imgPress)
    Bouton.super.init(self)
    self:moveTo(x, y)
    self.imgNormal =  gfx.image.new(imgNormal)
    self.imgSelect = gfx.image.new(imgSelect)
    self.imgPress = gfx.image.new(imgPress)
    self.etat = 0
    self:add()
end

function Bouton:update()
    Bouton.super.update(self)

    if self.etat == 0 then
        self:setImage(self.imgNormal)
    elseif self.etat == 1 then
        self:setImage(self.imgSelect)	
	elseif self.etat == 2 then
		self:setImage(self.imgPress)	
	end
   
end