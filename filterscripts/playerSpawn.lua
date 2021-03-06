local windowID = 200

local function createDialog()
	local diagLoaded = createDialogList(windowID, "Choose Team", 1, "Red", "Blue")
	if(windowID ~= true) then
		print("Dialog not created!")
		return
	end
	
	for id, weapData in pairs(weapons) do
		addDialogRow(dialogId, weapData[2])
	end
end
createDialog()

function pickTeam (playerid)
	showDialogList(playerid, windowID)
	sendMsgToAll(getPlayerName(playerid) .. "(" .. playerid .. ") has joined the server", 0xFFFFFFFF)
end
registerEvent("pickTeam", "onPlayerCredential")

function onDialogResponse (playerid, dialogid, buttonid, dialogRow)
	if (dialogid == windowID and buttonid == 1) then
		setPlayerSkin(playerid, 10)
		spawnPlayer(playerid, 2000.0, 200.0, 15.0)
		sendMsgToAll(getPlayerName(playerid) .. "(" .. playerid .. ") joined the red team", 0xFFFFFFFF)
		setPlayerColor(playerid, 0xFF0000FF)
	elseif (dialogid == windowID and buttonid == 2) then
		setPlayerSkin(playerid, 11)
		spawnPlayer(playerid, 2000.0, 200.0, 15.0)
		sendMsgToAll(getPlayerName(playerid) .. "(" .. playerid .. ") joined the blue team", 0xFFFFFFFF)
		setPlayerColor(playerid, 0x0000FFFF)
	else
		sendPlayerMsg(playerid, "Nothing picked", 0xFFFF0000)
		
	end
end
registerEvent("onDialogResponse", "onPlayerDialogResponse")

