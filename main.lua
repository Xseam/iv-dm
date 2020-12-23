require("/filterscripts/utility/utilis")
require("/filterscripts/utility/scriptLoader")

--I load the following scripts like this so I can reload them whenever using the rcon script
loadScript("rcon")
loadScript("playerSpawn")

setWorldMinuteDuration(1, 0)