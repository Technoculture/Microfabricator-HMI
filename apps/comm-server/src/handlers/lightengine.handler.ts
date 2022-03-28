export {}; // declare a module
const { logger } = require("../utils/logger.util");
const { clean_json_text } = require("../utils/cleanjson");

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
    if (val < 0) {
      this.val = 0;
    } else if (val > 100) {
      this.val = 100;
    } else {
      this.val = val;
    }
    // console.log(val);
  }
}

class ExposureDuration {
  // 0 <= d <= MAX_DURATION_IN_SEC
  val: number;

  constructor(val: number) {
    if (val < 0) {
      this.val = 0;
    } else if (val > MAX_DURATION_IN_SEC) {
      this.val = MAX_DURATION_IN_SEC;
    } else {
      this.val = val;
    }
    // console.log(dur);
  }
}

//
// Request Handler
//
const leLockHandler = (data: "ON" | "OFF") => {
  logger.debug(`LightEgine[Request]: ${data}`);

  if (data === "ON") {
    logger.info("LightEgineLock[Out]: ON");
  } else if (data === "OFF") {
    logger.info("LightEgineLock[Out]: OFF");
  } else {
    logger.error(`Invalid LightEgine Lock Request. ("${data}")`);
  }
};

const exposureInitiateHandler = (data: "ON" | "OFF") => {
  logger.debug(`ExposureInitiate[Request]: ${data}`);

  if (data === "ON") {
    logger.info("LightEgine[Out]: ON");
  } else if (data === "OFF") {
    logger.info("LightEgine[Out]: OFF");
  } else {
    logger.error(`Invalid LightEgine Request. ("${data}")`);
  }
};

const exposureSettingsHandler = (data: string) => {
  data = clean_json_text(data); // clean up data

  logger.debug(`ExposureSettingsHandler[Request]: ${data}`);

  let parsed_data = JSON.parse(data);
  // console.log(parsed_data);

  if (typeof parsed_data.power_percent !== "number") {
    logger.error(`Exposure Power Percent: Must be a valid number. (${data})`);
    return;
  } else if (typeof parsed_data.duration_in_sec !== "number") {
    logger.error(
      `Exposure Duration (in seconds): Must be a valid number. ("${data}")`
    );
    return;
  }

  const power = new ExposurePower(parsed_data.power_percent);
  const duration = new ExposureDuration(parsed_data.duration_in_sec);

  logger.debug(`ExposureInitiate[Request]: ${power.val}% for ${duration.val}s`);
};

module.exports = {
  leLockHandler,
  exposureInitiateHandler,
  exposureSettingsHandler,
};
