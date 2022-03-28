export {}; // declare a module
const { logger } = require("../utils/logger.util");

// Handler for:
// -----------
//
// EchoHandler
// DisconnectHandler

const echoHandler = (data: any) => {
  logger.debug(`echo: ${data}`);
};

const disconnectHandler = () => {
  logger.debug("Server Disconnected.");
};

module.exports = {
  echoHandler,
  disconnectHandler,
};
