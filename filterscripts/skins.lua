function onSkinCommand(playerid, text)
	if(string.sub(text, 1, 5) == "/skin") then
		local id = tonumber(string.sub(text, 7))
		if id == nil then
			sendPlayerMsg(playerid, "Not a number", 0xFFFF0000)
			return
		end
		setPlayerSkin(playerid, id)
	end
end
registerEvent("onSkinCommand", "onPlayerCommand")