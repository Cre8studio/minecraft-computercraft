const express = require('express')
const app = express()
var expressWs = require('express-ws')(app);
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!');
  // res.sendFile('./index.html', {root: __dirname })
});

let connections = []

app.ws('/', function(ws, req) {
  ws.id = connections.length+1
  function sendMessage(value, type="message", client) {
    if (client)
        return client.send(JSON.stringify({type: type, value: value}))
    return ws.send(JSON.stringify({type: type, value: value}))
  }

  console.log('new connection: ' + ws.id)
  connections.push(ws)

  ws.on('message', function(msg) {
    if (msg[0] === "{") //is json
      msg = JSON.parse(msg)
    console.log(msg);

    if (msg.type === "connect") {
        sendMessage("welcome " + msg.value)
    }

    if (msg.type === "update") {
      sendMessage("", "update")
      connections.forEach(c => {
        sendMessage("", "update", c)
      })
    }
  })

  ws.on('close', function(data) {
    console.log('closing connection: ' + ws.id)
    connections.splice(ws.id-1, 1)
  })
})

app.use(express.static('turtle'))

app.listen(port, () => {
  console.log(`Server started at http://localhost:${port}`);
});
