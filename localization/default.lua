return {
    descriptions = {
        Back={},
        Blind={},
        Edition={
            e_sgcry_graded = {
                name = "Graded",
                text = {
                    "{C:white,X:money}X#1#{} sell value",
                    "at end of round"
                }
            }
        },
        Enhanced={},
        Joker={
            j_cry_gemino = {
                name = "Gemini",
                text = {
                    "{C:attention}Square{} all values",
                    "of leftmost {C:attention}Joker{}",
                    "at end of round"
                }
            },
            j_sgcry_codething = {
                name = "Matrixed Joker",
                text = {
                    "Every {C:purple}Consumable{} is",
                    "considered a",
                    "{C:code}Code{} card"
                }
            },
            j_sgcry_sacrifdag = {
                name = "Sacrificial Dagger",
                text={
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "after destroying {C:red}20{} {C:dark_edition}Exotic{}",
                    "{C:attention}Jokers{}, sell this Joker to create an",
                    "{C:sgcry_extreme}Extreme{} rarity joker",
                    "{C:inactive}(#1#/20)"
                }
            },
            j_sgcry_extremekar = {
                name = "Karonine",
                text = {
                    "At end of round",
                    "{C:white,X:dark_edition}^#1#{} to all of",
                    "rightmost {C:attention}Jokers{} values"
                }
            }, 
            j_sgcry_truejim = {
                name = "True Jimbo",
                text = {
                    "{C:white,X:dark_edition}^^4{} Mult"
                }
            },
            j_sgcry_Crash = {
                name = "Arbituim",
                text = {
                    
                }
            },
            j_sgcry_tarot = {
                name = "Tratoline",
                text = {
                    "Every {C:tarot}Tarot{} card used",
                    "gives {C:dark_edition}+#2#{C:attention} Consumable slots",
                    "Empty {C:attention}Consumable slots{} give {X:dark_edition,C:white}^1{} Mult",
                    "{C:inactive}(Currently {C:dark_edition}+#1#{C:attention} Consumable slots{C:inactive})",
                }
            },
            j_sgcry_wgc = {
                name = "White and Gold Card",
                text = {
                    "This Joker gains",
                    "{C:red}+#1#{} Mult when any",
                    "{C:planet}Celestial Pack{} is opened",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)"
                }
            },
            j_sgcry_bbc = {
                name = "Black and Blue Card",
                text = {
                    "This Joker gains",
                    "{C:blue}+#1#{} Chips when any",
                    "{C:tarot}Arcana Pack{} is opened",
                    "{C:inactive}(Currently {C:blue}+#2#{C:inactive} Chips)"
                }
            },
            j_sgcry_evilfuckedupjoker = {
                name = "Evil fucked up Joker",
                text = {
                    "When Blind is selected, destroy",
                    "{C:attention}Rightmost Joker{}",
                    "and gain {C:white,X:mult}X#1#{} Mult",
                    "If no {C:attention}Joker{} is destroyed, {C:attention}Joker Resets",
                    "{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
                }
            },
            j_sgcry_spect = {
                name = "Vaneguard",
                text  ={
                    "{C:spectral}Spectral{} cards may show up in shop",
                    "Using a {C:spectral}Spectral{} card has a {C:green}#1# in 3{} chance",
                    "to create an {C:dark_edition}Empowered{} tag",
                    "{C:cry_exotic}Gateway{} no longer destroys {C:attention}Jokers"
                }
            }
        },
        Other={
            sgcry_placeholder = {
                name = "art",
                text = {"this art is a placeholder"}
            },
            sgcry_noext = {
                name = "awaw",
                text = {
                    "{C:inactive}(Cannot copy {C:sgcry_extreme}Extreme{C:inactive} rarity Jokers)"
                }
            }
        },
        Planet={},
        Spectral={
            c_cry_pointer = {
				name = "POINTER://",
				text = {
					"Create a card",
					"of {C:cry_code}your choice",
					"{C:inactive,s:0.8}(Exotic and Extreme Jokers excluded)",
				},
			},
            c_cry_gateway_alt = {
				name = "Gateway",
				text = {
					"Create a random",
					"{C:cry_exotic,E:1}Exotic{C:attention} Joker{}"
				},
			},
        },
        Stake={},
        Tag={},
        Tarot={},
        Voucher={
            v_sgcry_basicreroll = {
                name = "Reroll Inhibitor",
                text = {
                    "{C:green}+#1#{} rerolls before",
                    "losing {C:attention}shop slots{}"
                }
            },
            v_sgcry_rerolladvance = {
                name = "Reroll Fanatic",
                text = {
                    "{C:green}+#1#{} rerolls before",
                    "losing {C:attention}shop slots{}",
                    "{C:blue}+#2#{} pack slot"
                }
            },
            v_sgcry_rerollprof = {
                name = "Reroll Prophet",
                text = {
                    "{C:green}+#1#{} rerolls before",
                    "losing {C:attention}shop slots{}",
                    "{C:attention}+#2#{} shop slot"
                }
            }
        },
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_sgcry_extreme = "Extreme",
            k_sgcry_empower = "Empowered!"
        },
        high_scores={},
        labels={
            sgcry_extreme = "Extreme",
            sgcry_graded = "Graded"
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}