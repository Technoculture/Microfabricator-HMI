export {};
const { logger } = require("./logger.util");

const reqMsg = (module: string, data: string): void => {
  logger.debug(`${module.toUpperCase()}[Request]: "${data}"`);
};

const invalidReqMsg = (module: string, data: string): void => {
  logger.error(`Invalid ${module.toUpperCase()} Request: "${data}"`);
};

function validReqMsg<Type>(module: string, state: Type): void {
  logger.verbose(`${module.toUpperCase()}: ${state}`);
}

module.exports = {
  reqMsg,
  validReqMsg,
  invalidReqMsg,
};
