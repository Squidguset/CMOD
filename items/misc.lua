
local extreme_gradientslow = SMODS.Gradient({
    key="extremeslow",
    colours = {
        HEX("ff0000"),
        HEX("ffffff"), 
        HEX("5400ff"),
        HEX("000000")
    },
    cycle = 8
})


G.C.SGCRY_EXTREME = extreme_gradientslow



-- set sprites for extremes
local ssr = Card.set_sprites
function Card:set_sprites(_center,_front)
    local ret = ssr(self,_center,_front)
    if self.config.center.rarity == "sgcry_extreme" then
        self.children.laytwo = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.atlas] ,{x=self.config.center.pos.x+1,y=self.config.center.pos.y})
        self.children.laytwo:set_role({major = self, role_type = 'Glued', draw_major = self})
        self.children.laytwo.states.visible = false
        self.children.laythr = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.atlas] ,{x=self.config.center.pos.x+2,y=self.config.center.pos.y})
        self.children.laythr:set_role({major = self, role_type = 'Glued', draw_major = self})
        self.children.laythr.states.visible = false
        self.children.layfou = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.atlas] ,{x=self.config.center.pos.x+3,y=self.config.center.pos.y})
        self.children.layfou:set_role({major = self, role_type = 'Glued', draw_major = self})
        self.children.layfou.states.visible = false
    end
    return ret
end

-- rarity draw step
SMODS.DrawStep {
    key = "extreme",
    order = 200,
    func = function (self)
        if self.children.laytwo then

			local scale_mod = 0.07 + 0.02*math.sin(1.8*(G.TIMERS.REAL+0.25)) + 0.00*math.sin(((G.TIMERS.REAL+0.25) - math.floor((G.TIMERS.REAL+0.25)))*math.pi*14)*(1 - ((G.TIMERS.REAL+0.25) - math.floor((G.TIMERS.REAL+0.25))))^3
            local rotate_mod = 0.05*math.sin(1.219*(G.TIMERS.REAL+0.25)) + 0.00*math.sin(((G.TIMERS.REAL+0.25))*math.pi*5)*(1 - ((G.TIMERS.REAL+0.25) - math.floor((G.TIMERS.REAL+0.25))))^2

            if self.config.center.rotlayer == 2 then
                rotate_mod = rotate_mod + (G.TIMERS.REAL+0.25)
            end

			self.children.laytwo:draw_shader('dissolve',0, nil, false, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*(G.TIMERS.REAL+0.25)),nil, 0.6)
			self.children.laytwo:draw_shader('dissolve', nil, nil, false, self.children.center, scale_mod, rotate_mod)
        end
        if self.children.laythr then

			local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
            local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2

            if self.config.center.rotlayer == 3 then
                rotate_mod = rotate_mod + G.TIMERS.REAL
            end

			self.children.laythr:draw_shader('dissolve',0, nil, false, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
			self.children.laythr:draw_shader('dissolve', nil, nil, false, self.children.center, scale_mod, rotate_mod)
        end
        if self.children.layfou then

			local scale_mod = 0.07 + 0.02*math.sin(1.8*(G.TIMERS.REAL+0.5)) + 0.00*math.sin(((G.TIMERS.REAL+0.5) - math.floor((G.TIMERS.REAL+0.5)))*math.pi*14)*(1 - ((G.TIMERS.REAL+0.5) - math.floor((G.TIMERS.REAL+0.5))))^8
            local rotate_mod = 0.05*math.sin(1.219*(G.TIMERS.REAL+0.5)) + 0.00*math.sin(((G.TIMERS.REAL+0.5))*math.pi*5)*(1 - ((G.TIMERS.REAL+0.5) - math.floor((G.TIMERS.REAL+0.5))))^2

            if self.config.center.rotlayer == 4 then
                rotate_mod = rotate_mod + (G.TIMERS.REAL+0.5)
            end

			self.children.layfou:draw_shader('dissolve',0, nil, false, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*(G.TIMERS.REAL+0.5)),nil, 0.6)
			self.children.layfou:draw_shader('dissolve', nil, nil, false, self.children.center, scale_mod, rotate_mod)
        end
    end,
    conditions = {vortex = false, facing = "front"}
}
