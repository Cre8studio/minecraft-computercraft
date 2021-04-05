local trtl = {}

local inventory = {}
local minFuel = 400
local doDebug = false

--local fuel = {
--  {name="minecraft:coal", value=80}
--}

local blackListedBlocks = {"minecraft:grass_block", "minecraft:dirt", "minecraft:stone"}

function trtl.moveForward()
  if doDebug then
    print("Going forward")
  end
  turtle.dig()
  turtle.forward()
end

function trtl.digUp()
  turtle.digUp()
end

function trtl.checkFuel(iNumber)
  iNumber = tonumber(iNumber)
  local fuel = turtle.getFuelLevel()
  if (iNumber ~= nil) then
    if (fuel > iNumber) then
      return true
    else
      return false
    end
  end
  if fuel <= minFuel then
    -- run through the inventory to find coal
    -- use fuel until below fuel limit
  end
end

function trtl.inspect()
  local success, above = turtle.inspectUp()
  trtl.mine(above.name)
  local success, ahead = turtle.inspect()
  trtl.mine(ahead.name)
  local success, below = turtle.inspectDown()
  trtl.mine(below.name)
  turtle.turnLeft()
  local success, left = turtle.inspect()
  trtl.mine(left.name)
  turtle.turnRight()
  turtle.turnRight()
  local success, right = turtle.inspect()
  trtl.mine(right.name)
  turtle.turnLeft() -- facing forward
end

local function contains(table, val)
   for i=1,#table do
      if table[i] == val then
         return true
      end
   end
   return false
end

function trtl.mine(name)
  if (contains(blackListedBlocks, name) ~= true) then
    turtle.dig()
  end
end

function trtl.findFuel()
  local slot = 1
  for i=1, 16 do
    turtle.select(i)
    local item = turtle.getItemDetail()
    if (item ~= nil) then
      if (item.name == "minecraft:coal") then
        slot = i
      end
    end
  end
  turtle.select(1)

  return slot
end

return trtl
