print("Welcome to Cre8")
print("version 0.0.2")

minFuel = 400

local tArgs = {...}
local doDebug = false

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
  
  if fuel <= minFuel then
    -- run through the inventory to find coal
    -- use fuel until below fuel limit
  end
end

function searchInventoryFirst(name)
  local returnValue = nil
  
  for i=1, 16, 1 do
    turtle.select(i)
    inventory[i] = turtle.getItemDetail()
    if inventory[i] ~= nil then
      if inventory[i].name == name then
        returnValue = i
        return returnValue
      end
    end
  end
  
  if doDebug then
    debugInventory()
  end
  
  return returnValue
end

function getInventory()
  for i=1, 16, 1 do
    turtle.select(i)
    inventory[i] = turtle.getItemDetail()
  end
end

function searchInventory(name)
  local returnValue = nil
  
  for i=1, 16, 1 do
    turtle.select(i)
    inventory[i] = turtle.getItemDetail()
    if inventory[i] ~= nil then
      if inventory[i].name == name then
        returnValue = i
      end
    end
  end
  
  if doDebug then
    for i=1, #inventory do
      if inventory[i] ~= nil then
        print(inventory[i].name .. ": " .. inventory[i].count)
      end
    end
  end
  
  return returnValue
end

function refuel()
  -- determine maximum fuel limit  
  local fuel = turtle.getFuelLevel()
  local maxFuel = turtle.checkFuelLimit()
  -- find fuel we can use
  fuelSlot = searchInventoryFirst("minecraft:coal")
  turtle.select(fuelSlot)
  -- work out the amount of fuel this slot will give
  -- refuelAmount = inventory[slot].count * 80 -- remove hardcoding, use the fuel array in config
  -- refuel until the fuel is done or before the maximum limit is reached
  local iter = 0
  repeat
    item = turtle.getItemDetail()
    turtle.refuel(1)
    iter = iter + 1
    print("refueled: " .. iter)
  until (item == nil)
end

function debugInventory()
  for i=1, #inventory do
    if inventory[i] ~= nil then
      print(inventory[i].name .. ": " .. inventory[i].count)
    end
  end
end

if #tArgs > 0 then
  for i=1, tArgs[1], 1 do
    moveForward()
  end
end

getInventory()
refuel()
