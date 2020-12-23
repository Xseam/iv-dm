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

