-- Copyright sader fawall

name = "Victory Road Hoenn 1F [ALL]"
author = "sader fawall"
description = [[Start anywhere between Ever Grande City and Victory Road Hoenn 1F.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Ever Grande City" then
			moveToMap("Ever Grande City")
		elseif getMapName() == "Ever Grande City" then
			moveToMap("Victory Road Hoenn 1F")
		elseif getMapName() == "Victory Road Hoenn 1F" then
			moveToRectangle(20, 38 , 20, 45)
		end
	else
		if getMapName() == "Victory Road Hoenn 1F" then
			moveToMap("Ever Grande City")
		elseif getMapName() == "Ever Grande City" then
			moveToMap("Pokecenter Ever Grande City")
		elseif getMapName() == "Pokecenter Ever Grande City" then
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