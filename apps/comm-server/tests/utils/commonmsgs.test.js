// export { };
const { logger } = require("../../src/utils/logger.util");
const { reqMsg, validReqMsg, invalidReqMsg } = require("../../src/utils/commonmsgs");

test("reqMsg logs to debug with string name and data", () => {
  const loggerSpy = jest.spyOn(logger, "debug");

  const data = `{ "randomLabel": "label" }`;

  reqMsg("module", data);
  expect(loggerSpy).toHaveBeenCalledWith(`MODULE[Request]: "{ "randomLabel": "label" }"`);
});

test("invalidReqMsg logs to error with string name and data", () => {
  const loggerSpy = jest.spyOn(logger, "error");

  const data = `{ randomLabel: label }`;

  invalidReqMsg("module", data);
  expect(loggerSpy).toHaveBeenCalledWith(`Invalid MODULE Request: "{ randomLabel: label }"`);
});

test("validReqMsg logs to verbose with string name and data", () => {
  const loggerSpy = jest.spyOn(logger, "verbose");

  const data = `{ "randomLabel": "label" }`;

  validReqMsg("module", data);
  expect(loggerSpy).toHaveBeenCalledWith(`MODULE: { "randomLabel": "label" }`);
});
