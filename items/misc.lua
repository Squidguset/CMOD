
SGCRY = {}

SGCRY.GGLOBALS = {}
SMODS.current_mod.reset_game_globals = function (run_start)
    for i,v in ipairs(SGCRY.GGLOBALS) do
        SGCRY.GGLOBALS[i](run_start)
    end
end

function sgcagg(func)
    table.insert(SGCRY.GGLOBALS,func)
end


SMODS.Sound {
    key = "expgeneric",
    path = "generic_reverb.ogg"
}

SMODS.Sound {
    key = "consumeableinc",
    path = "consumeableup.ogg"
}

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
        
        for x = 1, self.config.center.extrlayers do
        self.children["extremelay"..x] = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[self.config.center.atlas] ,{x=self.config.center.pos.x+x,y=self.config.center.pos.y})
        self.children["extremelay"..x]:set_role({major = self, role_type = 'Glued', draw_major = self})
        self.children["extremelay"..x].states.visible = false
        end
    end
    return ret
end

-- rarity draw step
SMODS.DrawStep {
    key = "extreme",
    order = 200,
    func = function (self)
        local timer = G.TIMERS.REAL
        if self.config.center.rarity == "sgcry_extreme"  then
        for x = 1, self.config.center.extrlayers  do
            if self.children["extremelay"..x] then
            local timeroff = timer + x*.25

			local scale_mod = 0.07 + 0.02*math.sin(1.8*timeroff) + 0.00*math.sin((timeroff - math.floor(timeroff))*math.pi*14)*(1 - (timeroff - math.floor(timeroff)))^3
            local rotate_mod = 0.05*math.sin(1.219*timeroff) + 0.00*math.sin((timeroff)*math.pi*5)*(1 - (timeroff - math.floor(timeroff)))^2

            local xoff = 0
            local yoff = 0

            if self.config.center.rotlayer == x then
                rotate_mod = rotate_mod + timeroff
            end
            if self.config.center.facelayer == x then
                xoff = 0.05*math.sin(0.8*timeroff)
                yoff = 0.05*math.sin((1.6*timeroff)+0.5)
            end

			self.children["extremelay"..x]:draw_shader('dissolve',0, nil, false, self.children.center,scale_mod, rotate_mod,xoff,yoff + 0.1 + 0.03*math.sin(1.8*timeroff),nil, 0.6)
			self.children["extremelay"..x]:draw_shader('dissolve', nil, nil, false, self.children.center, scale_mod, rotate_mod, xoff, yoff)
        end
        end
        end
    end,
    conditions = {vortex = false, facing = "front"}
}

-- show no extreme copies
SMODS.Joker:take_ownership("j_cry_altgoogol",{
    loc_vars = function (self, info_queue, card)
        local main_end
        if G.jokers and G.jokers.cards then
                for k, v in ipairs(G.jokers.cards) do
                    if (v.config.center and v.config.center.rarity == "sgcry_extreme") and (G.localization.descriptions.Other.sgcry_noext)then 
                        main_end = {}
                        localize{type = 'other', key = 'sgcry_noext', nodes = main_end, vars = {}}
                        main_end = main_end[1]
                        break
                    end
                end
            end
            return { key = Cryptid.gameset_loc(self, { modest = "balanced" }), vars = { card.ability.copies },main_end = main_end }
    end
}, true)

SMODS.Consumable:take_ownership("c_cry_analog",{
can_use = function (self, card)
        
        if G.jokers and G.jokers.cards then
                for k, v in ipairs(G.jokers.cards) do
                    if (v.config.center and v.config.center.rarity ~= "sgcry_extreme") then 
                            return #G.jokers.cards > (G.GAME.modifiers.cry_beta and 1 or 0)
                    end
                end
            end
            return false
end,
	loc_vars = function(self, info_queue, center)
        local main_end
        if G.jokers and G.jokers.cards then
                for k, v in ipairs(G.jokers.cards) do
                    if (v.config.center and v.config.center.rarity == "sgcry_extreme") and (G.localization.descriptions.Other.sgcry_noext)then 
                        main_end = {}
                        localize{type = 'other', key = 'sgcry_noext', nodes = main_end, vars = {}}
                        main_end = main_end[1]
                        break
                    end
                end
            end
            return { key = Cryptid.gameset_loc(self, { modest = "balanced" }),
            vars = {
				math.min(center.ability.copies, center.ability.immutable.max_copies),
				math.min(center.ability.ante, center.ability.immutable.max_ante),
			},
            main_end = main_end }
	end,

},true)

SMODS.Joker:take_ownership("j_cry_speculo",{
    loc_vars = function(self, info_queue, center)
		if not center.edition or (center.edition and not center.edition.negative) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		end
        local main_end
        if G.jokers and G.jokers.cards then
                for k, v in ipairs(G.jokers.cards) do
                    if (v.config.center and v.config.center.rarity == "sgcry_extreme") and (G.localization.descriptions.Other.sgcry_noext)then 
                        main_end = {}
                        localize{type = 'other', key = 'sgcry_noext', nodes = main_end, vars = {}}
                        main_end = main_end[1]
                        break
                    end
                end
            end
            return {main_end = main_end }
	end,
}, true)


Cryptid.pointerblistifytype("rarity","sgcry_extreme")