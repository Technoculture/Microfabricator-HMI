export {}; // declare a module
const { logger } = require("../utils/logger.util");

// Handler for:
// -----------
//
// Drawer: Request, Response
// Clamp: Request, Response
// VibrationUpdate
// WaferMaskDistanceUpdate

type DrawerRequest = "OPEN" | "CLOSE";

const drawerHandler = (data: DrawerRequest) => {
  logger.debug(`Drawer[Request]: ${data}`);

  if (data === "OPEN") {
    logger.verbose("Drawer[Out]: OPEN");
  } else if (data === "CLOSE") {
    logger.verbose("Drawer[Out]: CLOSE");
  } else {
    logger.error("Invalid Drawer Request");
  }
};

type ClampRequest = "ON" | "OFF";

const clampHandler = (data: ClampRequest) => {
  logger.debug(`Clamp[Request]: ${data}`);

  if (data === "ON") {
    logger.verbose("Clamp[Out]: ON");
  } else if (data === "OFF") {
    logger.verbose("Clamp[Out]: OFF");
  } else {
    logger.error("Invalid Clamp Request");
  }
};

module.exports = {
  drawerHandler,
  clampHandler,
};
