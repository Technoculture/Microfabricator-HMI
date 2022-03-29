export {}; // declare a module
const { logger } = require("../utils/logger.util");
const socket = require("socket.io");

// Handler for:
// -----------
//
// EchoHandler
// DisconnectHandler

const echoHandler = (data: string) => {
  logger.debug(`echo: ${data}`);
};

const disconnectHandler = () => {
  logger.debug("Server Disconnected.");
};

module.exports = {
  echoHandler,
  disconnectHandler,
};
