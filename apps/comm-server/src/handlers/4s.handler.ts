export {}; // declare a module
// const { logger } = require("../utils/logger.util");

const { reqMsg, validReqMsg, invalidReqMsg } = require("../utils/commonmsgs");

// Handler for:
// -----------
//
// Drawer: Request, Response
// Clamp: Request, Response
// VibrationUpdate
// WaferMaskDistanceUpdate

type DrawerRequest = "OPEN" | "CLOSE";
type ClampRequest = "ON" | "OFF";

const drawerHandler = (data: DrawerRequest) => {
  reqMsg("drawer", data);

  if (data === "OPEN") {
    validReqMsg("drawer", "OPEN");
  } else if (data === "CLOSE") {
    validReqMsg("drawer", "CLOSE");
  } else {
    invalidReqMsg("drawer", data);
  }
};

const clampHandler = (data: ClampRequest) => {
  reqMsg("clamp", data);

  if (data === "ON") {
    validReqMsg("clamp", "ON");
  } else if (data === "OFF") {
    validReqMsg("clamp", "OFF");
  } else {
    invalidReqMsg("clamp", data);
  }
};

module.exports = {
  drawerHandler,
  clampHandler,
};
