export {} // declare a module
const { logger } = require('../utils/logger.util');

// Handler for:
// -----------
//
// LightEngineLock ✅
// ExposureInitiate ✅
// ExposureSettings ✅
// ProgressResponse 

//
// value types
//
const MAX_DURATION_IN_SEC = 24 * 60 * 60;

class ExposurePower {
  // 0 <= p <= 100
  val: number;

  constructor(val: number) {
    if (val < 0) { this.val = 0; } 
    else if (val > 100) { this.val = 100; } 
    else { this.val = val; }
    // console.log(val);
  }
}

class ExposureDuration {
  // 0 <= d <= MAX_DURATION_IN_SEC
  val: number;

  constructor(val: number) {
    if (val < 0) { this.val = 0; }
    else if (val > MAX_DURATION_IN_SEC) { this.val = MAX_DURATION_IN_SEC; }
    else { this.val = val; }
    // console.log(dur);
  }
}

const clean_json_text = (json_text: string) => {
  return json_text.replace(/\s/g, "").replace(/(\r\n|\n|\r)/gm, "");
}

// 
// Request Handler
//
const leLockHandler = (data: string) => {
  logger.debug(`LightEgine[Request]: ${data}`);

  if (data === 'ON') { logger.verbose('LightEgine[Out]: Switched ON'); } 
  else if (data === 'OFF') { logger.verbose('LightEgine[Out]: Switched OFF'); } 
  else { logger.error("Invalid LightEgine Request"); }
}

const exposureInitiateHandler = (data: string) => {
  logger.debug(`ExposureInitiate[Request]: ${data}`);
}

const exposureSettingsHandler = (data: string) => {
  logger.debug(`ExposureSettingsHandler[Request]: ${clean_json_text(data)}`);

  let parsed_data = JSON.parse(data);
  // console.log(parsed_data);

  if (typeof(parsed_data.power_percent) !== 'number') {
    logger.error("Exposure Power Percent: Must be a valid number.");
    return;
  } else if (typeof(parsed_data.duration_in_sec) !== 'number') {
    logger.error("Exposure Duration (in seconds): Must be a valid number.");
    return;
  }

  const power = new ExposurePower(parsed_data.power_percent);
  const duration = new ExposureDuration(parsed_data.duration_in_sec);

  logger.debug(`ExposureInitiate[Request]: ${power.val}% for ${duration.val}s`);
}

module.exports = {
  leLockHandler,
  exposureInitiateHandler,
  exposureSettingsHandler
};
