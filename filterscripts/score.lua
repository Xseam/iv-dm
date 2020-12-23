local redKills = 0
local blueKills = 0

local roundStart = os.time()
local roundEnd = roundStart+600

function killCounter (playerid, lastDamageType, lastDamageGiver)
    if (lastDamageType == 0 and getPlayerColor(playerid) ~= getPlayerColor(lastDamageGiver)) then
        if getPlayerColor(lastDamageGiver) == 0xFF0000FF then
            redKills = redKills + 1      
        elseif getPlayerColor(lastDamageGiver) == 0x0000FFFF then
            blueKills = blueKills + 1
        else
            print("could not assign the point")
        end
    else
        print("error on killCounter")
    end
end
registerEvent("killCounter", "onPlayerDeath")



function resetKillCounter ()
     redKills = 0
     blueKills = 0
end

-- function startRound

-- end

function guiText (playerid)
    if(string.sub(text, 1, 6) == "/point") then
        drawText(playerid, 10, 0.4, 0.5, 0.2, 0.54, "Hello ~r~Red", 0, 0xFFFFFFFF)
	end
end
registerEvent("guiText", "onPlayerCommand")

function changePoints(playerid, text)
	if(string.sub(text, 1, 6) == "/score") then
		redKills = redKills + 1
	end
end
registerEvent("changePoints", "onPlayerCommand")

