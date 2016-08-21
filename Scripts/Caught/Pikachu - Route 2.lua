-- Copyright sader fawall

name = "Pikachu - Route 2"
author = "sader fawall"
description = [[Start anywhere between Viridian City and Route 2.]]

function onPathAction()
	if getUsablePokemonCount() > 1 then
		if getMapName() == "Pokecenter Viridian" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			moveToMap("Route 2")
		elseif getMapName() == "Route 2" then
			moveToMap("Route 2 Stop")
		elseif getMapName() == "Route 2 Stop" then
			moveToMap("Viridian Forest")
		elseif getMapName() == "Viridian Forest" then
			moveToRectangle(12, 63, 17, 63)
		end
	else
		if getMapName() == "Viridian Forest" then
			moveToMap("Route 2 Stop")
		elseif getMapName() == "Route 2 Stop" then
			moveToMap("Route 2")
		elseif getMapName() == "Route 2" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			moveToMap("Pokecenter Viridian")
		elseif getMapName() == "Pokecenter Viridian" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or getOpponentName() == "Pikachu" )then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		else
		return sendUsablePokemon() or sendAnyPokemon() or attack() or run()
		end
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
