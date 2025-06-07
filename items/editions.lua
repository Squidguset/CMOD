SMODS.Shader {key = "graded",path = "graded.fs",
send_vars = function (self, sprite, card)
    return {
          --  ext = {G.C.SGCRY_EXTREME[1],G.C.SGCRY_EXTREME[2],G.C.SGCRY_EXTREME[3],G.C.SGCRY_EXTREME[4]}
        }
end}

-- sound by lexi
SMODS.Sound {
    key = "gradedsound",
    path = "graded.ogg"
}

SMODS.Edition {
    key = "graded",
    shader = "graded",
    config = {extra = {inc = 2},immutable = {inc = 0}},
    sound = {sound = "sgcry_gradedsound"},
    loc_vars = function (self, info_queue, card)
        return {
            vars = {card.edition.extra.inc}
        }
    end,
    weight = 3,
    on_remove = function (card)
        card.sell_cost = card.sell_cost - card.edition.immutable.inc
    end,
    calculate = function (self, card, context)
        if context.end_of_round and context.main_eval and card.sell_cost then
            card.edition.immutable.inc = card.sell_cost * card.edition.extra.inc
            card.sell_cost = card.sell_cost * card.edition.extra.inc
        end
    end
}