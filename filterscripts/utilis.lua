function split(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result
end

function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
  end
  
  function getPos(playerid, text)
      local command = trim(text)
      if(command == "/pos") then
          -- Gets player position
          local x, y, z = getPlayerPos(playerid)
      
          -- https://www.tutorialspoint.com/lua/lua_file_io.htm
          -- Opens a file in append mode
          file = io.open("positions.txt", "a")
  
          -- sets the default output file as positions.txt
          io.output(file)
  
          -- appends the player command info to the last line of the file
          io.write("setPlayerPos("..x..", "..y..", "..z..")\n")
  
          -- closes the open file
          io.close(file)
          
          sendPlayerMsg(playerid, "Position saved!: x: "..x..", y: "..y..", z: "..z..")", 0xFFFF00FF)
      end	
  end
  registerEvent("getPos", "onPlayerCommand")