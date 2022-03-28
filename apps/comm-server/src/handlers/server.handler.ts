export {} // declare a module
const { logger } = require('../utils/logger.util');

// Handler for:
// -----------
//
// EchoHandler
// DisconnectHandler

const echoHandler = (data: any) => {
  logger.info(`echo: ${data}`);
};

const disconnectHandler = () => {
  logger.info("Server Disconnected."); 
}

module.exports = {
  echoHandler,
  disconnectHandler
}
