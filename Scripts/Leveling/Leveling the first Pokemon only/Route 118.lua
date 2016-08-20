-- Copyright sader fawall

name = "Route 118"
author = "sader fawall"
description = [[Start anywhere between Mauville City and Route 118.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Mauville City" then
			moveToMap("Mauville City")
		elseif getMapName() == "Mauville City" then
			moveToMap("Mauville City Stop House 4")
		elseif getMapName() == "Mauville City Stop House 4" then
			moveToMap("Route 118")
		elseif getMapName() == "Route 118" then
			moveToRectangle(29, 23 , 35, 23)
		end
	else
		if getMapName() == "Route 118" then
			moveToMap("Mauville City Stop House 4")
		elseif getMapName() == "Mauville City Stop House 4" then
			moveToMap("Mauville City")
		elseif getMapName() == "Mauville City" then
			moveToMap("Pokecenter Mauville City")
		elseif getMapName() == "Pokecenter Mauville City" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") then
			return
		else
		return sendUsablePokemon() or sendAnyPokemon() or attack() or run()
		end
	elseif getActivePokemonNumber() == 1 then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end