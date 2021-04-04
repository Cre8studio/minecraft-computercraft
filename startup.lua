print("Welcome to Cre8")
print("version 0.0.2")

minFuel = 400

local tArgs = {...}
local doDebug = true

inventory = {}

local fuel = {
  {name="minecraft:coal", value=80}
}

function moveForward()
  if doDebug then
    print("Going forward")
  end
  turtle.dig()
  turtle.forward()
end

function checkFuel()
  local fuel = turtle.getFuelLevel()
  local maxFuel = turtle.checkFuelLimit()
  
  if fuel <= minFuel then
    -- run through the inventory to find coal
    -- use fuel until below fuel limit
  end
end

function searchInventory(name)
  local returnValue = nil
  
  for i=0, i<16, 1 do
    turtle.select(i)
    inventory[i] = turtle.getItemDetail()
    if inventory[i].name == name then
      returnValue = i
    endls
  end
  
  if doDebug then
    for i=0, #inventory do
      print(inventory.name[i] .. ": " .. inventory[i].count)
    end
  end
  
  return returnValue
end

function refuel(slot=1)
  turtle.select(slot)
  turtle.refuel(1)
end

if #tArgs > 0 then
  for i=1, tArgs[1], 1 do
    moveForward()
  end
end

inv = searchInventory("minecraft:coal")
print(inv)
