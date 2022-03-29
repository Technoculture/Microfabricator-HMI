const server = require("http").createServer();
const io = require("socket.io")(server);

const { logger } = require("./utils/logger.util");

const { fanHandler } = require("./handlers/base.handler");
const { drawerHandler, clampHandler } = require("./handlers/4s.handler");
const { echoHandler, disconnectHandler } = require("./handlers/server.handler");
const {
  leLockHandler,
  exposureInitiateHandler,
  exposureSettingsHandler,
} = require("./handlers/lightengine.handler");
const { startTimers, closeTimers } = require("./handlers/timers");

//
// DOTENV
require("dotenv").config();

// Setup PORT Variable
const PORT = process.env.PORT || 9443;
if (process.env.PORT === undefined) {
  logger.error(`.env file containing PORT variable not found.`);
}
logger.verbose(`Using PORT: ${PORT}`);

//
// Connection Handlers for SocketIO
//
const connectionHandler = (client: any) => {
  logger.info("Server Connected.");

  const timers = startTimers(client);

  // Server
  client.on("echo", echoHandler);
  client.on("disconnect", () => {
    closeTimers(timers);
    logger.debug("Server Disconnected.");
  });

  // Base Module
  client.on("fan", fanHandler);

  // Light Engine Module
  client.on("lelock", leLockHandler);
  client.on("exposureinit", exposureInitiateHandler);
  client.on("exposureset", exposureSettingsHandler);

  // 4S Module
  client.on("drawer", drawerHandler);
  client.on("clamp", clampHandler);
};

io.on("connection", connectionHandler);

server.listen(PORT);
logger.debug("Server entry point");
