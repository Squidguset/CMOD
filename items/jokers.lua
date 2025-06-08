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