SMODS.Atlas {
    key = "vouchers",
    path = "vouchers.png",
    px=71,py=95
}

SMODS.Voucher {
    key = "basicreroll",
    atlas = "vouchers",
    pos = {x=0,y=0},
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {key = "sgcry_placeholder",set = "Other"}
        return {
            vars = {
                card.ability.extra.gives
            }
        }
    end,
    config = {extra = {gives = 5}},
    redeem = function (self, voucher)
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll + voucher.ability.extra.gives
        G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft + voucher.ability.extra.gives
    end
}

SMODS.Voucher {
    key = "rerolladvance",
    atlas = "vouchers",
    pos = {x=0,y=1},
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {key = "sgcry_placeholder",set = "Other"}
        return {
            vars = {
                card.ability.extra.gives,
                card.ability.extra.booster
            }
        }
    end,
    config = {extra = {gives = 5,booster = 1}},
    redeem = function (self, voucher)
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll + voucher.ability.extra.gives
        G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft + voucher.ability.extra.gives
        SMODS.change_booster_limit(voucher.ability.extra.booster)
    end
}

SMODS.Voucher {
    key = "rerollprof",
    atlas = "vouchers",
    pos = {x=0,y=2},
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {key = "sgcry_placeholder",set = "Other"}
        return {
            vars = {
                card.ability.extra.gives,
                card.ability.extra.shop
            }
        }
    end,
    config = {extra = {gives = 10,shop = 1}},
    redeem = function (self, voucher)
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll + voucher.ability.extra.gives
        G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft + voucher.ability.extra.gives
        change_shop_size(voucher.ability.extra.shop)
    end
}