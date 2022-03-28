export {}; // declare a module
const { logger } = require("../utils/logger.util");

// Handler for:
// -----------
//
// FanRequest ✅
// AirQualityUpdate

type FanRequest = "ON" | "OFF";

const fanHandler = (data: FanRequest) => {
  logger.debug(`Fan[Request]: ${data}`);

  if (data === "ON") {
    logger.verbose("Fan[Out]: ON");
  } else if (data === "OFF") {
    logger.verbose("Fan[Out]: OFF");
  } else {
    logger.error(`Invalid Fan Request. ("${data}")`);
  }
};

module.exports = {
  fanHandler,
};
