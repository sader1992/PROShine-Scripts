-- Copyright sader fawall

name = "Charmander - Cinnabar mansion 3"
author = "sader fawall"
description = [[Start anywhere between Cinnabar Island and Cinnabar mansion 3.]]

function onPathAction()
	if getUsablePokemonCount() > 1 then
		if getMapName() == "Pokecenter Cinnabar" then
			moveToMap("Cinnabar Island")
		elseif getMapName() == "Cinnabar Island" then
			moveToMap("Cinnabar mansion 1")
		elseif getMapName() == "Cinnabar mansion 1" then
			moveToMap("Cinnabar mansion 2")
		elseif getMapName() == "Cinnabar mansion 2" then
			moveToMap("Cinnabar mansion 3")
		elseif getMapName() == "Cinnabar mansion 3" then
			moveToRectangle(7, 14, 7, 19)
		end
	else
		if getMapName() == "Cinnabar mansion 3" then
			moveToMap("Cinnabar mansion 2")
		elseif getMapName() == "Cinnabar mansion 2" then
			moveToMap("Cinnabar mansion 1")
		elseif getMapName() == "Cinnabar mansion 1" then
			moveToMap("Cinnabar Island")
		elseif getMapName() == "Cinnabar Island" then
			moveToMap("Pokecenter Cinnabar")
		elseif getMapName() == "Pokecenter Cinnabar" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or getOpponentName() == "Charmander" )then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
