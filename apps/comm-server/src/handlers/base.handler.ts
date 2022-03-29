export {}; // declare a module
const { reqMsg, validReqMsg, invalidReqMsg } = require("../utils/commonmsgs");

// Handler for:
// -----------
//
// FanRequest ✅
// AirQualityUpdate

type FanRequest = "ON" | "OFF";

const fanHandler = (data: FanRequest) => {
  const mod = "Fan";
  reqMsg(mod, data);

  if (data === "ON") {
    validReqMsg(mod, "ON");
  } else if (data === "OFF") {
    validReqMsg(mod, "OFF");
  } else {
    invalidReqMsg(mod, data);
  }
};

module.exports = {
  fanHandler,
};
