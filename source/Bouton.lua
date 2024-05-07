import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Bouton').extends(gfx.sprites)

function Bouton:init(x, y, imgNormal, imgSelect, imgPress)
    Bouton.super.init(self)
    self:moveTo(x, y)
    self.imgNormal = gfx.image.new(imgNormal)
    self:setImage(self.imgNormal)
    self.imgSelect = gfx.image.new(imgSelect)
    self.imgPress = gfx.image.new(imgPress)
end

function Bouton:update(state)
    
end