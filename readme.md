# A computercraft love story

I wanted to replicate what u/Ottomated achieved in his last video on youtube, so I decided to follow in his footsteps and create a websocket server to manage the script automatically.

This projects makes use of express.js with websockets and ngrok (to expose).

The turtle will download startup.lua with `wget <ngrok url>/startup.lua startup.lua`
which will then download all the dependencies.

## Installation

You will need node/npm. After cloning the repo, try

`npm install`

it will download all of the required dependencies.

The package relies on ngrok so try

`npm i -g ngrok`

to start the webserver try

`node index.js`

to expose the webserver

`ngrok http 3000`

## TODO

- Create a package manager, so than I can download the programs I want to make use of
- Create a GUI to select the programs
- recreate some classic programs like
  1. Strip mining
  2. Quarry
  3. Tree farm
  4. Food farm
  5. House builder (blueprint/schematics)
  
I have also had a dream of attempting the challenge where the turtle starts at overworld and has to accomplish simple tasks.
