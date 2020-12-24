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

function drawScore()
	local players = getPlayers()
		
	for i, id in ipairs(players) do
		drawInfoText(id, "~r~Red:~w~ " .. redKills .. " | ~b~Blue:~w~ "..blueKills.."", 600)
	end
end
local speedoTimer = setTimer("drawScore", 150, 0)

function changePoints(playerid, text)
	if(string.sub(text, 1, 6) == "/score") then
        redKills = redKills + 1
        sendPlayerMsg(playerid, "Position saved!: x: "..x..", y: "..y..", z: "..z..")", 0xFFFF00FF)
	end
end
registerEvent("changePoints", "onPlayerCommand")

