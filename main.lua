Cryptid.mod_whitelist["CMOD"] = true

assert(SMODS.load_file("items/editions.lua"))()

SMODS.Atlas {
    key = "jokers",
    path = "Jokers.png",
    px=71,py=95
}



SMODS.Joker {
    key = "codething",
    atlas = "jokers",
    pos = {x=1,y=0},
    rarity = "cry_epic",
    cost = 15,
}


SMODS.Joker {
    key = "sacrifdag",
    atlas = "jokers",
    pos = {x=3,y=0},
    rarity = 3,
    cost = 12,
    demicoloncompat = true,
    eternal_compat = false,
    config = {immutable = {exotics = 0}},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.immutable.exotics}}
    end,
    calculate = function (self,card,context)
        if not context.blueprint then
        if (context.setting_blind and not card.getting_sliced) or context.forcetrigger then
        local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then my_pos = i; break end
                end
                if my_pos and G.jokers.cards[my_pos+1] and not card.getting_sliced and not G.jokers.cards[my_pos+1].ability.eternal and not G.jokers.cards[my_pos+1].getting_sliced then 
                    local sliced_card = G.jokers.cards[my_pos+1]
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.joker_buffer = 0
                        if sliced_card.config.center.rarity == "cry_exotic" then card.ability.immutable.exotics = card.ability.immutable.exotics + 1 end
                        if card.ability.immutable.exotics >= 20 then juice_card_until(card,function () return true end) end
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                        play_sound('slice1', 0.96+math.random()*0.08)
                    return true end }))
                    
                end
            end
        if context.selling_self then
            if card.ability.immutable.exotics >= 20 then
                if #G.jokers.cards < G.jokers.config.card_limit - (card.edition and card.edition.negative and 1 or 0) then
                    SMODS.add_card{
                        rarity = "sgcry_extreme",
                        set = "Joker",
                        area = G.jokers
                    }
                else
                    return {
                        message = localize('k_no_room_ex'),
                        colour = G.C.RARITY.sgcry_extreme
                    }
                end
            else
                
            end
        end
    end
end
}

-- gradient
local extreme_gradient = SMODS.Gradient({
    key="extreme",
    colours = {
        HEX("ff0000"),
        HEX("ffffff"), 
        HEX("5400ff"),
        HEX("000000")
    },
    cycle = 2
})

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
-- rarity
SMODS.Rarity {
    key = "extreme",
    badge_colour = extreme_gradient,
    default_weight = 0,
    
    pools = {
        ["Joker"] = false,
    },
    
}


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

-- karonine
SMODS.Joker {
    key = "extremekar",
    rarity = "sgcry_extreme",
    pos = {x=0,y=1},
    cost = 100,
    atlas = "jokers",
    rotlayer = 2,
    editlayer =3,
    no_doe = true,
    config = {extra = {change = 3}},
    blueprint_compat = true,
    demicoloncompat = true,
    -- code taken from gemini with light tweaks
    loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
            vars = {card.ability.extra.change},
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								colour = G.C.JOKER_GREY,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
	end,
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			other_joker = G.jokers.cards[#G.jokers.cards]
			if other_joker and other_joker ~= card and not (Card.no(other_joker, "immutable", true)) then
				card.ability.blueprint_compat = "compatible"
			else
				card.ability.blueprint_compat = "incompatible"
			end
		end
	end,
    calculate = function(self, card2, context)
		if (context.end_of_round and not context.repetition and not context.individual) or context.forcetrigger then
			local check = false
			local card = G.jokers.cards[#G.jokers.cards]
			if card ~= card2 and not Card.no(G.jokers.cards[#G.jokers.cards], "immutable", true) then
				Cryptid.with_deck_effects(G.jokers.cards[#G.jokers.cards], function(card)
					Cryptid.misprintize(card, { min = card2.ability.extra.change, max = card2.ability.extra.change }, nil, true, "^")
				end)
				check = true
			end
			if check then
				card_eval_status_text(
					context.blueprint_card or card2,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GREEN }
				)
			end
			return nil, true
		end
	end,
}

-- true jimbo

SMODS.Joker {
    key = "truejim",
    atlas = "jokers",
    cost = 100,
    no_doe = true,
    pos = {x=0,y=2},
    blueprint_compat = true,
    rarity = "sgcry_extreme",
    immutable = true,
    calculate = function (self, card, context)
        if context.joker_main then
            return{
                eee_mult = 4
            }
        end
    end
    
}