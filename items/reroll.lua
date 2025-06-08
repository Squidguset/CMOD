sgcagg(function (run_start)
    if run_start then
        G.GAME.sgcryfreereroll = G.GAME.sgcryfreereroll or 5
        G.GAME.sgcryrerollleft = G.GAME.sgcryfreereroll
        G.GAME.sgcryrerollcost = 0
    end
end)

local rrsr = G.FUNCS.reroll_shop
function  G.FUNCS:reroll_shop(e)
    
    if G.GAME.sgcryrerollleft > 0 then
    G.GAME.sgcryrerollleft = G.GAME.sgcryrerollleft - 1
    else
        change_shop_size(-1)
        G.GAME.sgcryrerollcost = G.GAME.sgcryrerollcost + 1
    end
    local ret = rrsr(e)
    
    return ret
end

local tsr = G.FUNCS.toggle_shop
function  G.FUNCS:toggle_shop(e)
    local ret = tsr(e)
    G.GAME.sgcryrerollleft = G.GAME.sgcryfreereroll
    change_shop_size(G.GAME.sgcryrerollcost)
    G.GAME.sgcryrerollcost = 0
    return ret
end
