const server = require('http').createServer();
const io = require('socket.io')(server);
const winston = require('winston');

const logger = winston.createLogger({
  level: 'verbose',
  defaultMeta: { service: 'mfab-hardware-service' },
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.prettyPrint()
  ),
  transports: [
    //
    // - Write all logs with importance level of `error` or less to `mfab-error.log`
    // - Write all logs with importance level of `info` or less to `mfab.log`
    //
    new winston.transports.File({ filename: 'mfab-error.log', level: 'error' }),
    new winston.transports.File({ filename: 'mfab.log' }),
  ],
});


//
// If we're not in production then log to the `console` with the format
//
if (process.env.NODE_ENV !== 'production') {
  logger.add(new winston.transports.Console({
    level: 'silly',
    format: winston.format.simple()
  }));
}

logger.verbose("Server entry point");
logger.silly("Hello");
// logger.info("Server entry point");

io.on('connection', (client: any) => {
  logger.info("Connection Started.");

  client.on('event', (data: any) => {

  });
  client.on('disconnect', () => {

  });
});

server.listen(3000);
