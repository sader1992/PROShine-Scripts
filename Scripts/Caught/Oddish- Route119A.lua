-- Copyright sader fawall

name = "Oddish- Route119A"
author = "sader fawall"
description = [[Start anywhere between Fortree City and Route119A.]]

function onPathAction()
	if getUsablePokemonCount() > 1 then
		if getMapName() == "Pokecenter Fortree City" then
			moveToMap("Fortree City")
		elseif getMapName() == "Fortree City" then
			moveToMap("Route 119A")
		elseif getMapName() == "Route 119A" then
			moveToRectangle(34, 19, 34, 25)
		end
	else
		if getMapName() == "Route 119A" then
			moveToMap("Fortree City")
		elseif getMapName() == "Fortree City" then
			moveToMap("Pokecenter Fortree City")
		elseif getMapName() == "Pokecenter Fortree City" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or getOpponentName() == "Oddish")then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		else
		return sendUsablePokemon() or sendAnyPokemon() or attack() or run()
		end
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
