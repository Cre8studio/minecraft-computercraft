-- doesn't actually return anything
-- trying to make it run in background using multishell
local wss = {} -- websocketserver

websocketServer = "654e37f672fa.ngrok.io"

function wss.downloadFile(name)
  if name == nil then
    name = "startup.lua"
  end
  local content = http.get("http://" .. websocketServer .. "/" .. name)
  local file = fs.open(name,"w")
  file.write(content.readAll())
  file.close()
end

local ws, err = http.websocket("ws://" .. websocketServer)

function sendMessage(msg, typ)
  if typ == nil then
    typ = "message"
  end
  ws.send(textutils.serializeJSON({type=typ, value=msg}))
end

if ws then
  print('Started WebSocketServer')
  sendMessage(os.getComputerLabel(), "connect")

  while true do
    local received = ws.receive()
    obj = textutils.unserializeJSON(received)
    if (obj.type == "message") then
      print(obj.value)
    end
    if (obj.type == "update") then
      -- send manifest
      print("updating now!")
      wss.downloadFile("startup.lua")
      wss.downloadFile("/lib/turtle.lua")
      wss.downloadFile("/lib/ws.lua")
      os.reboot()
    end
  end
  ws.close()
end

return wss
