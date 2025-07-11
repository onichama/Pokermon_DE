init = function()
  local backapply_orig = Back.apply_to_run
  function Back.apply_to_run(self)
    backapply_orig(self)
    			G.E_MANAGER:add_event(Event({
					func = function()
            if G.GAME.modifiers.poke_force_seal then
              for i = 1, #G.playing_cards do
                G.playing_cards[i]:set_seal(G.GAME.modifiers.poke_force_seal, true)
              end
            end
						return true
					end,
				}))
  end
end

local pokemondeck = {
	name = "pokemondeck",
	key = "pokemondeck",  
	order = 17,
  unlocked = true,
  discovered = true,
	config = {vouchers = { "v_poke_goodrod"}, consumables = {'c_poke_pokeball'}},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize("goodrod_variable"), localize("pokeball_variable")}}
  end,
	pos = { x = 0, y = 0 },
	atlas = "pokedeck",
}

local luminousdeck = {
	name = "luminousdeck",
	key = "luminousdeck",  
	order = 18,
  unlocked = true,
  discovered = true,
	config = {},
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 1, y = 0 },
	atlas = "pokedeck",
  apply = function(self)
    G.GAME.modifiers.apply_type = true
  end
}

local obituarydeck = {
	name = "obituarydeck",
	key = "obituarydeck",  
	order = 21,
  unlocked = true,
  discovered = true,
	config = {},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize("pinkseal_variable")}}
  end,
	pos = { x = 2, y = 0 },
	atlas = "pokedeck",
  apply = function(self)
    G.GAME.modifiers.poke_force_seal = "poke_pink_seal"
  end,
}

local revenantdeck = {
	name = "revenanteck",
	key = "revenantdeck",  
	order = 22,
  unlocked = true,
  discovered = true,
	config = {},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize("silverseal_variable")}}
  end,
	pos = { x = 5, y = 0 },
	atlas = "pokedeck",
  apply = function(self)
    G.GAME.modifiers.poke_force_seal = "poke_silver"
  end,
}

local telekineticdeck = {
	name = "telekineticdeck",
	key = "telekineticdeck",  
	order = 19,
  unlocked = true,
  discovered = true,
	config = {vouchers = { "v_crystal_ball"}, consumables = {'c_poke_twisted_spoon', 'c_poke_twisted_spoon'}},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize{type = 'name_text', key = 'v_crystal_ball', set = 'Voucher'}, localize("twisted_spoon_variable")}}
  end,
	pos = { x = 3, y = 0 },
	atlas = "pokedeck",
} 

local ampeddeck = {
	name = "ampeddeck",
	key = "ampeddeck",  
	order = 20,
  unlocked = true,
  discovered = true,
	config = {vouchers = { "v_poke_energysearch"}, consumables = {'c_poke_double_rainbow_energy'}},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize{type = 'name_text', key = 'v_poke_energysearch', set = 'Voucher'}, localize("double_rainbow_energy_variable")}}
  end,
	pos = { x = 4, y = 0 },
	atlas = "pokedeck",
} 

local dList = {luminousdeck, telekineticdeck, ampeddeck}

if pokermon_config.pokeballs then
  table.insert(dList, 1, pokemondeck)
end

if pokermon_config.pokemon_legacy then
  table.insert(dList, obituarydeck)
  table.insert(dList, revenantdeck)
end

return {name = "Back",
        init = init,
        list = dList
}