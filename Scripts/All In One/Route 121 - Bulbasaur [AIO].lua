-- Copyright sader fawall

name = "Route 118 [ALL]"
author = "sader fawall"
description = [[Start anywhere between Lilycove City and Route 120.]]

function onPathAction()
	if getUsablePokemonCount() > 1 then
		if getMapName() == "Pokecenter Lilycove City" then
			moveToMap("Lilycove City")
		elseif getMapName() == "Lilycove City" then
			moveToMap("Route 121")
		elseif getMapName() == "Route 121" then
			moveToMap("Route 120")
		elseif getMapName() == "Route 120" then
			moveToRectangle(28, 91 , 35, 91)
		end
	else
		if getMapName() == "Route 120" then
			moveToMap("Route 121")
		elseif getMapName() == "Route 121" then
			moveToMap("Lilycove City")
		elseif getMapName() == "Lilycove City" then
			moveToMap("Pokecenter Lilycove City")
		elseif getMapName() == "Pokecenter Lilycove City" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or getOpponentName() == "Bulbasaur")then
		if useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") then
			return
		else
		return sendUsablePokemon() or sendAnyPokemon() or attack() or run()
		end
	else
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	end
end