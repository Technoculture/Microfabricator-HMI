const logger = require('./src/logger.util');

const server = require('http').createServer();
const io = require('socket.io')(server);

io.on('connection', (client: any) => {
  logger.info("Connection Started.");
  
  client.on('event', (data: any) => {
    
  });
  client.on('disconnect', () => {
    
  });
});

server.listen(9443);
logger.verbose(`Server entry point`);
