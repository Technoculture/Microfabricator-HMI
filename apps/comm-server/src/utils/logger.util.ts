export {}; // declare a module

import winston from "winston";
import DailyRotateFile from "winston-daily-rotate-file";

require("dotenv").config();

const logger = winston.createLogger({
  level: "debug",
  // defaultMeta: { service: "mfab-hardware-service" },
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.prettyPrint()
  ),
  transports: [
    //
    // - Write all logs with importance level of `error` or less to `mfab-error.log`
    // - Write all logs with importance level of `info` or less to `mfab.log`
    //
    new DailyRotateFile({
      filename: "mfab-error-%DATE%.log",
      dirname: "log",
      level: "error",
      datePattern: "YY-MM-DD",
      maxFiles: "14d",
    }),
    new DailyRotateFile({
      filename: "mfab-%DATE%.log",
      dirname: "log",
      datePattern: "YY-MM-DD",
      maxFiles: "14d",
    }),
  ],
});

//
// If we're not in production then log to the `console` with the format
//
if (process.env.NODE_ENV !== "production") {
  logger.add(
    new winston.transports.Console({
      level: process.env.LOGLEVEL || "verbose",
      format: winston.format.combine(
        winston.format.colorize({ all: true }),
        winston.format.simple()
      ),
    })
  );
}

module.exports = { logger };
