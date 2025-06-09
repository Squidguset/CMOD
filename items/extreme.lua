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
    facelayer = 3,
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
					{ message = localize("k_upgrade_ex"), colour = G.C.GREEN, sound = "sgcry_expgeneric" }
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
    facelayer = 3,
    blueprint_compat = true,
    rarity = "sgcry_extreme",
    immutable = true,
    calculate = function (self, card, context)
        if context.joker_main then
            return{
                ee_mult = 4
            }
        end
    end
    
}

sgcry_arbituim_msg = {
    "a11 cr45h 61^3 4CE",
    "all cr4s# Gi>E 4ce",
    "a|l (rash G!v3 4(3",
    "a[[ C*@5h Giv3 4ce",
    "@lL cR@$H g!v3 4c3",
    "a11 C®4$# GI>3 ace",
    "Al| ¢R@sH g1^3 A¢3",
    "a[[ (rA$H GIv3 4cE",
    "A1l cR@5# gIv3 Ace",
    "@L1 ¢Ra$# GI^3 aC3",
    "aL| (R@$H g!>3 4C3",
    "A[[ C®@$# giV3 AcE",
    "a1L cr@$# G!v3 a<3",
    "aLL (R4$# gi>3 4Ce",
    "@l1 ¢r@$h G!v3 Ac3",
    "A1| CR@$# G!V3 a(3",
    "a[[ cRa$# g1v3 A(3",
    "a11 ¢R@5h GIv3 aC3",
    "Al| (R@$# g!V3 4¢e",
    "@LL Cr@$# gIv3 Ac3",
    "a|L cR@5H g1^3 A(3",
    "a1l C®@$# G!>3 aCe",
    "@1L cr4$H giV3 4c3",
    "A[[ ¢R@$h G!V3 ac3",
    "a|L (RA$H G!v3 4c3",
    "@lL cR@$H g!v3 Ac3",
    "Al1 c®@$# G!v3 4c3",
    "@1L CR@$# G!v3 A(3",
    "a11 C®4$# GI>3 Ac3",
    "Al| ¢R@sH g1^3 Ac3",
    "a[[ (rA$H GIv3 4cE",
    "A1l cR@5# gIv3 A(3",
    "@L1 ¢Ra$# GI^3 aC3",
    "aL| (R@$H g!>3 4C3",
    "A[[ C®@$# giV3 4cE",
    "a1L cr@$# G!v3 a<3",
    "aLL (R4$# gi>3 4Ce",
    "@l1 ¢r@$h G!v3 Ac3",
    "A1| CR@$# G!V3 a(3",
    "a[[ cRa$# g1v3 A(3",
    "a11 ¢R@5h GIv3 aC3",
    "Al| (R@$# g!V3 4¢e",
    "@LL Cr@$# gIv3 Ac3",
    "a|L cR@5H g1^3 A(3",
    "a1l C®@$# G!>3 aCe",
    "@1L cr4$H giV3 4c3",
    "A[[ ¢R@$h G!V3 ac3",
    "a11 cr45h 61^3 4ÇE",
    "a11 cr4sh 6î^3 4ÇE",
    "a11 cräsh 61^3 4CE",
    "a11 cråsh 61^3 4Ce",
    "a11 crâsh 61^3 4Ce",
    "a11 cräsh 61^3 4cë",
    "all crâsh gîv3 4Ce",
    "a|l crâsh gïv3 4cë",
    "a|l cräsh gîv3 4Cë",
    "all cräsh gîv3 4Cë",
    "a|l cråsh givë 4Ce",
    "all cräsh givë 4ce",
    "a11 cråsh gîvë 4ce",
    "a11 cråsh gîv3 4cë",
    "all cråsh gîvë 4cë",
    "a11 cråsh gïv3 4ce",
    "all cräsh gîvë 4cë",
    "a11 cråsh gîvë 4Ce",
    "a11 cräsh gîv3 4cë",
    "a11 cräsh gîvë 4Ce",
    "a11 crâsh gîvë 4cë",
    "a11 cråsh gîvë 4Ce",
    "a11 cråsh gïvë 4ce",
    "a11 crâsh gïvë 4Ce",
    "a11 cräsh gîvë 4cë",
    "a11 crâsh gïv3 4cë",
    "a11 crâsh gïvë 4ce",
    "a11 cräsh gîvë 4Ce",
    "a11 crâsh gîv3 4ce",
    "a11 cräsh gïvë 4cë",
    "a11 cräsh gïv3 4Ce",
    "a11 cråsh gïvë 4cë",
    "a11 cråsh gîvë 4ce",
    "a11 crâsh gîvë 4Ce",
    "a11 cråsh gîvë 4cë",
    "a11 cräsh gïvë 4Ce",
    "a11 cr45h g!v3 a¢3",
    "a|L cr4$h g!v3 4¢E",
    "a11 cr45h 61^3 4¢E",
    "Al| cr@$h g!v3 4cE",
    "a1L cr@$h g!v3 Ac3",
    "a11 cr@$h giV3 4c3",
    "aL| cr45h g!v3 aCE",
    "all cr@$h g!v3 4c3",
    "a|l cr4$h g!v3 4c3",
    "a11 cr@$h g!v3 A¢3",
    "a11 cr4sh g!v3 a¢3",
    "a|L cr@$h g!v3 4CE",
    "a11 cr@$h giV3 4c3",
    "al| cr45h g!v3 4ce",
    "a11 cr@$h g!v3 4ce",
    "a11 cr4sh g!v3 4ce",
    "a11 cr4sh giV3 4ce",
    "a|l cr4$h g!v3 4ce",
    "a11 cr@$h g!v3 4ce",
    "a11 cr4sh g!v3 4ce",
    "a11 cr@$h g!v3 4ce",
    "a|l cr4sh g!v3 4ce",
    "a11 cr@$h g!v3 4ce"
}

SMODS.Joker {
    key = "Crash",
    atlas = "jokers",
    cost = 100,
    no_doe = true,
    facelayer = 3,
    pos = {x=0,y=3},
    rarity = "sgcry_extreme",
       loc_vars = function(self, info_queue, card)
        --Taken directly, modified, and uses dependencies from Cryptid's ERROR
        return {
            main_start = {
                {
                    n = G.UIT.O,
                    config = {
                        object = DynaText({
                            --string = asc_misprint_operators,
                            string = sgcry_arbituim_msg,
                            colours = { G.C.SET.Code},
                            pop_in_rate = 9999999,
                            silent = true,
                            random_element = true,
                            pop_delay = 0.30,
                            scale = 0.32,
                            min_cycle_time = 0,
                        }),
                    },
                },
            },
        }
    end,
}



SMODS.Joker {
    key = "tarot",
    atlas = "jokers",
    pos = {x=0,y=4},
    no_doe = true,
    cost = 100,
    facelayer = 2,
    rarity = "sgcry_extreme",
    config = {immutable = {gained = 0, inc = 2, req = 1}},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.immutable.gained, card.ability.immutable.inc, card.ability.immutable.req } }
    end,
    calculate = function (self, card, context)
        if
			context.using_consumeable
			and context.consumeable.ability.set == "Tarot"
			and not context.consumeable.beginning_end
			and not context.blueprint
		then
            card.ability.immutable.gained = card.ability.immutable.gained + card.ability.immutable.inc
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.immutable.inc
            card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.PURPLE, sound = "sgcry_consumeableinc" }
				)
        end
        if context.joker_main then
            return{
                e_mult = 1 + (G.consumeables.config.card_limit - #G.consumeables.cards)
            }
        end
    end,
    add_to_deck = function (self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.immutable.gained
    end,
    remove_from_deck = function (self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.immutable.gained
    end


}

SMODS.Joker {
    key = "spect",
    atlas = "jokers",
    pos = {x=0,y=5},
    rarity = "sgcry_extreme",
    rotlayer = 2,
    facelayer = 3,
    no_doe = true,
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS.tag_cry_empowered
        return{
            vars = {
                G.GAME.probabilities.normal or 1
            }
        }
    end,
    add_to_deck = function (self, card, from_debuff)
        G.GAME.spectral_rate = G.GAME.spectral_rate + 10
    end,
    remove_from_deck = function (self, card, from_debuff)
        G.GAME.spectral_rate = G.GAME.spectral_rate - 10
    end,
    calculate = function (self, card, context)
        if
			context.using_consumeable
			and context.consumeable.ability.set == "Spectral"
			and not context.consumeable.beginning_end
		then
            if pseudorandom("extremespect") <= G.GAME.probabilities.normal / 3 then
            add_tag(Tag("tag_cry_empowered"))
            card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_sgcry_empower"), colour = G.C.CRY_EXOTIC, sound = "talisman_emult" }
				)
            else
                card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_nope_ex"), colour = G.C.RED}
				)
            end
        end
    end
}


SMODS.Consumable:take_ownership("c_cry_gateway",{
    loc_vars = function(self, info_queue, card)
        local key, vars
        if next(SMODS.find_card("j_sgcry_spect")) then
            key = self.key .. "_alt"
           
        else
            key = self.key
            
            
        end
        return { key = key, vars = vars }
    end,
    can_use = function(self, card)
		
        if next(SMODS.find_card("j_sgcry_spect")) then
        -- just check for space
        return #G.jokers.cards < G.jokers.config.card_limit
        else
        --Don't allow use if everything is eternal and there is no room
		return #Cryptid.advanced_find_joker(nil, nil, nil, { "eternal" }, true, "j") < G.jokers.config.card_limit
        end
	end,
	use = function(self, card, area, copier)
        if not next(SMODS.find_card("j_sgcry_spect")) then
		local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			if not v.ability.eternal then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					if v.config.center.rarity == "cry_exotic" then
						check_for_unlock({ type = "what_have_you_done" })
					end
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				return true
			end,
		}))
    end
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "cry_gateway")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
	end
},true)