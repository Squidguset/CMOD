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

-- rarity
SMODS.Rarity {
    key = "extreme",
    badge_colour = extreme_gradient,
    default_weight = 0,
    
    pools = {
        ["Joker"] = false,
    },
    
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