Cryptid.mod_whitelist["CMOD"] = true

assert(SMODS.load_file("items/editions.lua"))()
assert(SMODS.load_file("items/jokers.lua"))()
assert(SMODS.load_file("items/extreme.lua"))()
assert(SMODS.load_file("items/misc.lua"))()
assert(SMODS.load_file("items/reroll.lua"))()


SMODS.Atlas {
    key = "jokers",
    path = "Jokers.png",
    px=71,py=95
}







