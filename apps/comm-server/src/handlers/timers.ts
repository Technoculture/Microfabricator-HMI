export {};
const { logger } = require("../utils/logger.util");

const startTimers = (client: any): NodeJS.Timeout[] => {
  return [
    setInterval(() => {
      logger.verbose(`Vibration: (Every 1000ms)`);
      client.emit("vibration", "hello");
    }, 1000),
    setInterval(() => {
      logger.verbose(`Wafer Mask Gap: (Every 100ms)`);
      client.emit("wafermaskgap", "hello");
    }, 100),
    setInterval(() => {
      logger.verbose(`Light Intensity: (Every 500ms)`);
      client.emit("lightintensity", "hello");
    }, 500),
  ];
};

const closeTimers = (timers: NodeJS.Timeout[]) => {
  for (const timer of timers) {
    clearInterval(timer);
  }
  logger.info(`Timers closed: ${timers}`);
};

module.exports = {
  startTimers,
  closeTimers,
};
