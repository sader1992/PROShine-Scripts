-- Copyright sader fawall

name = "Mt. Silver 1F"
author = "sader fawall"
description = [[This level only the first Low level pokemon (read how it work.txt) ,Start anywhere in Mt. Silver Exterior.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Mt. Silver Pokecenter" then
			moveToMap("Mt. Silver Exterior")
		elseif getMapName() == "Mt. Silver Exterior" then
			moveToMap("Mt. Silver 1F")
		elseif getMapName() == "Mt. Silver 1F" then
			moveToRectangle(49, 50 , 49, 54)
		end
	else
		if getMapName() == "Mt. Silver 1F" then
			moveToMap("Mt. Silver Exterior")
		elseif getMapName() == "Mt. Silver Exterior" then
			moveToMap("Mt. Silver Pokecenter")
		elseif getMapName() == "Mt. Silver Pokecenter" then
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
		return sendAnyPokemon(2) or attack() or sendUsablePokemon() or run()
	else
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	end
end

