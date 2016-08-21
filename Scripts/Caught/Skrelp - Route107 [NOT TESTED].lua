-- Copyright sader fawall

name = "Skrelp - Route107"
author = "sader fawall"
description = [[Start anywhere between Dewford town and Route 107.]]

function onPathAction()
	if getUsablePokemonCount() > 1 then
		if getMapName() == "Pokecenter Dewford town" then
			moveToMap("Dewford town")
		elseif getMapName() == "Dewford town" then
			moveToMap("Route 7")
		elseif getMapName() == "Route 107" then
			moveToWater()
		end
	else
		if getMapName() == "Route 107" then
			moveToMap("Dewford town")
		elseif getMapName() == "Dewford town" then
			moveToMap("Pokecenter Dewford town")
		elseif getMapName() == "Pokecenter Dewford town" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or getOpponentName() == "Skrelp")then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		else
		return sendUsablePokemon() or sendAnyPokemon() or attack() or run()
		end
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
