-- Copyright sader fawall

name = "Squirtle - Vermilion City"
author = "sader fawall"
description = [[Start anywhere in Vermilion City.]]

function onPathAction()
	if getUsablePokemonCount() >= 1 then
		if getMapName() == "Pokecenter Vermilion" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToWater()
		end
	else
		if getMapName() == "Vermilion City" then
			moveToMap("Pokecenter Vermilion")
		elseif getMapName() == "Pokecenter Vermilion" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or getOpponentName() == "Squirtle")then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
