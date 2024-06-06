import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Image').extends(gfx.sprite)

function Image:init(x, y, img)
    Bouton.super.init(self)
    self:moveTo(x, y)
    self.img = gfx.image.new(img)
    self.etat = 0
    self:add()
end

function Image:update()
    Image.super.update(self)

    if self.etat == 1 then
        self:setImage(self.img)	
	end
   
end