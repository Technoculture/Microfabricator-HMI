const logger = require('./src/logger');

const server = require('http').createServer();
const io = require('socket.io')(server);

logger.verbose("Server entry point");
logger.silly("Hello");

io.on('connection', (client: any) => {
  logger.info("Connection Started.");

  client.on('event', (data: any) => {

  });
  client.on('disconnect', () => {

  });
});

server.listen(3000);
