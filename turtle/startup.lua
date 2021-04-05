print("Welcome to Cre8")
print("version 0.0.12")

local tArgs = {...}

if #tArgs > 0 then
  --detect the parameters
end

--pick up if the lib files exist, otherwise download them
--if (fs.exists("/lib") ~= true) then
--  local content = http.get("http://" .. websocketServer .. "/" .. name)
--  local file = fs.open(name,"w")
--  file.write(content.readAll())
--  file.close()
--end

multishell.launch({}, "/lib/ws.lua")

if (fs.exists("/lib/turtle.lua") == true) then
  local trtl = require "/lib/turtle"

  print("length of tunnel")
  local length = read()

  -- determine current fuel
  print("Current Fuel Level: " .. turtle.getFuelLevel())
  print("Fuel to be used: " .. length)
  if (trtl.checkFuel(length) == true) then
    print("We have enough fuel")
  else
    print("We need more fuel")
    -- initiate refueling
    local fuelSlot = trtl.findFuel()
    turtle.select(fuelSlot)
    turtle.refuel(1)
    turtle.select(1)
  end
  for i=1, length, 1 do
    trtl.moveForward()
    trtl.digUp()
    --determine block left and right, compare against blacklist, if not in blacklist, dig it up
    trtl.inspect()
  end
  -- if fuel is needed, refuel

  print("Job complete!")
end
