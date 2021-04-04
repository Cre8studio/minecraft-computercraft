print("Welcome to Cre8")

local tArgs = {...}
local doDebug = true

function moveForward()
  if doDebug do
    print("Going forward")
  end
  turtle.dig()
  turtle.forward()
end

if #tArgs > 0 do 
  for i=1, tArgs[1], 1 do
    moveForward()
  end
end
