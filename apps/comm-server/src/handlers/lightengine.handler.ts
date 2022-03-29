export {}; // declare a module
// const { logger } = require("../utils/logger.util");
const { clean_json_text } = require("../utils/cleanjson");
const { reqMsg, validReqMsg, invalidReqMsg } = require("../utils/commonmsgs");

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
  const mod = "LightEngineLock";
  reqMsg(mod, data);

  if (data === "ON") {
    validReqMsg(mod, data);
  } else if (data === "OFF") {
    validReqMsg(mod, data);
  } else {
    invalidReqMsg(mod, data);
  }
};

const exposureInitiateHandler = (data: "ON" | "OFF") => {
  const mod = "LightEngine";
  reqMsg(mod, data);

  if (data === "ON") {
    validReqMsg(mod, data);
  } else if (data === "OFF") {
    validReqMsg(mod, data);
  } else {
    invalidReqMsg(mod, data);
  }
};

const exposureSettingsHandler = (data: string) => {
  const mod = "ExposureSettingsHandler";

  data = clean_json_text(data); // clean up data
  reqMsg(mod, data);

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

  validReqMsg(mod, `${power.val}% for ${duration.val}s`);
};

module.exports = {
  leLockHandler,
  exposureInitiateHandler,
  exposureSettingsHandler,
};
