-- Copyright sader fawall

name = "Route 110"
author = "sader fawall"
description = [[Start anywhere between Slateport City and Route 110.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Slateport" then
			moveToMap("Slateport City")
		elseif getMapName() == "Slateport City" then
			moveToMap("Route 110")
		elseif getMapName() == "Route 110" then
			moveToRectangle(12, 130 , 20, 130)
		end
	else
		if getMapName() == "Route 110" then
			moveToMap("Slateport City")
		elseif getMapName() == "Slateport City" then
			moveToMap("Pokecenter Slateport")
		elseif getMapName() == "Pokecenter Slateport" then
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

