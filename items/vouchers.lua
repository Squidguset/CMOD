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
    end,
    unredeem = function (self, voucher)
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll - voucher.ability.extra.gives
        G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft - voucher.ability.extra.gives
    end,
    in_pool =function (self, args)
        return G.GAME.sgcrydorerolls
    end
}

SMODS.Voucher {
    key = "rerolladvance",
    atlas = "vouchers",
    pos = {x=0,y=1},
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gives,
                card.ability.extra.booster
            }
        }
    end,
    requires = {"v_sgcry_basicreroll"},
    config = {extra = {gives = 5,booster = 1}},
    redeem = function (self, voucher)
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll + voucher.ability.extra.gives
        G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft + voucher.ability.extra.gives
        SMODS.change_booster_limit(voucher.ability.extra.booster)
    end,
    unredeem = function (self, voucher)
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll - voucher.ability.extra.gives
        G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft - voucher.ability.extra.gives
        SMODS.change_booster_limit(-voucher.ability.extra.booster)
    end,
    in_pool =function (self, args)
        return G.GAME.sgcrydorerolls
    end
}

SMODS.Voucher {
    key = "rerollprof",
    atlas = "vouchers",
    pos = {x=0,y=2},
    requires = {"v_sgcry_rerolladvance"},
    pools = { ["Tier3"] = true },
    loc_vars = function (self, info_queue, card)
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
    end,
    unredeem = function (self, voucher)
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll - voucher.ability.extra.gives
        G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft - voucher.ability.extra.gives
        change_shop_size(-voucher.ability.extra.shop)
    end,
    in_pool =function (self, args)
        return G.GAME.sgcrydorerolls
    end
}