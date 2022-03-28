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

const PORT = 9443;

const connectionHandler = (client: any) => {
  logger.info("Server Connected.");

  // Server
  client.on("echo", echoHandler);
  client.on("disconnect", disconnectHandler);

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
logger.verbose("Server entry point");
