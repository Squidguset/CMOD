Cryptid.mod_whitelist["CMOD"] = true


assert(SMODS.load_file("items/editions.lua"))()
assert(SMODS.load_file("items/jokers.lua"))()
assert(SMODS.load_file("items/extreme.lua"))()
assert(SMODS.load_file("items/misc.lua"))()
assert(SMODS.load_file("items/reroll.lua"))()
assert(SMODS.load_file("items/vouchers.lua"))()

SGCRY.SMCM = SMODS.current_mod

sgcagg(function (rs)
    if rs then
        G.GAME.sgcrydorerolls = SGCRY.SMCM.config.reroll
    end
end)

SMODS.current_mod.config_tab = function()
	return {n = G.UIT.ROOT, config = {
        r = 0.1
		-- config values here, see 'Building a UI' page
	}, nodes = {
		{n=G.UIT.C,config = {padding = 0.1,align = "cm"},nodes = {
            create_toggle({
                label = "Reroll Rework",
                ref_table = SGCRY.SMCM.config,
                ref_value = "reroll",
                active_colour = G.C.GREEN
            }),
            {n=G.UIT.R, config = {align = "cm", padding= 0}, nodes={
          {n=G.UIT.T, config={text = "(Only applies at start of run)", scale = 0.35, colour = G.C.UI.TEXT_LIGHT}}
            }}
        }},
        
	}}
end







