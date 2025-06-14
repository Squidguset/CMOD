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

SMODS.Joker {
    key = "wgc",
    atlas = "jokers",
    pos = {x=4,y=0},
    cost = 3,
    rarity = 1,
    blueprint_compatible = true,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.inc,
                card.ability.extra.mult
            }
        }
    end,
    config = {extra = {inc = 4,mult = 0}},
    calculate = function (self, card, context)
       if context.joker_main then
            return{
                mult = card.ability.extra.mult
            }
        end
        if context.open_booster and context.card.config.center.kind == "Celestial" and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.inc
            card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.RED}
				)
        end
    end
}

SMODS.Joker {
    key = "bbc",
    atlas = "jokers",
    pos = {x=5,y=0},
    cost = 3,
    rarity = 1,
    blueprint_compatible = true,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.inc,
                card.ability.extra.chips
            }
        }
    end,
    config = {extra = {inc = 9,chips = 0}},
    calculate = function (self, card, context)
       if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end
        if context.open_booster and context.card.config.center.kind == "Arcana" and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.inc
            card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.BLUE}
				)
        end
    end
}


SMODS.Joker {
    key = "evilfuckedupjoker",
    atlas = "jokers",
    pos = {x=6,y=0},
    rarity = 3,
    blueprint_compatible = true,
    config = {extra = {inc = 0.75,xmult = 1}},
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.inc,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return{
                xmult = card.ability.extra.xmult
            }
        end
        if not context.blueprint then
        if (context.setting_blind and not card.getting_sliced) then
        local my_pos = #G.jokers.cards - 1
                if my_pos and G.jokers.cards[my_pos+1] and not card.getting_sliced and not G.jokers.cards[my_pos+1].ability.eternal and not G.jokers.cards[my_pos+1].getting_sliced then 
                    local sliced_card = G.jokers.cards[my_pos+1]
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.inc
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                        play_sound('slice1', 0.96+math.random()*0.08)
                    return true end }))
                    
                    else
                        card.ability.extra.xmult = 1
                        card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_reset"), colour = G.C.RED}
				)
                    end
            end
    end
end
}

SMODS.Joker {
    key = "crowker",
    atlas = "jokers",
    pos = {x = 8, y = 0},
    config = {extra = 2},
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra
            }
        }
    end,
    calc_dollar_bonus = function (self, card)
        return card.ability.extra
    end
}

SMODS.Joker {
    key = "zaffre",
    atlas = "jokers",
    pos = {x =4, y = 1},
    blueprint_compatible = true,
    config = {extra = {increase = 0.5}, xmult = 1},
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.increase, card.ability.xmult
            }
        }
    end,
    calculate = function (self, card, context)
         if context.open_booster and context.card.config.center.kind == "Spectral" and not context.blueprint then
            card.ability.xmult = card.ability.xmult + card.ability.extra.increase
            card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.RED}
				)
        end
        if context.joker_main then
            return{
                xmult = card.ability.xmult
            }
        end
    end
}