// Handler for:
// -----------
//
// FanRequest
// AirQualityUpdate
export {}

const { logger } = require('./logger.util');

type FanRequest = 'ON' | 'OFF';

const fanReqHandler = (data: FanRequest) => {
  logger.debug(`Fan[Request]: ${data as FanRequest}`);

  if (data === 'ON') {
    logger.verbose('Fan[Out]: Switched ON'); 
  } else if (data === 'OFF') {
    logger.verbose('Fan[Out]: Switched OFF');
  } else {
    logger.error("Invalid Fan Request"); 
  }
};

module.exports = fanReqHandler;