const server = require('http').createServer();
const io = require('socket.io')(server);

const { logger } = require('./src/logger.util');
const fanRequestHandler = require('./src/base.handler');

const echoHandler = (data: any) => {
  logger.info(`echo: ${data}`);
};

const disconnectHandler = () => {
  logger.info("Server Disconnected."); 
}

io.on('connection', (client: any) => {
  logger.info("Server Connected.");
  
  client.on('echo', echoHandler);
  client.on('fanrequest', fanRequestHandler);
  client.on('disconnect', disconnectHandler);
});

server.listen(9443);
logger.verbose("Server entry point");
