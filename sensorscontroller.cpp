#include "sensorscontroller.h"

SensorsController::SensorsController(QObject *parent, QString port_name)
    : QObject(parent){
//    try {
//        serial_ = new ucSerial(this, port_name);
//    } catch (...) {
//        qDebug() << "Failed to Setup communications with SensorsController.";
//    }

    modes_["LIGHT_SENSOR"] = 1;
    modes_["VIBRATION_SENSOR"] = 2;
    modes_["TEMPERATURE_SENSOR"] = 3;
    modes_["SIT_IDLE"] = 4;
}

void SensorsController::mode(const QString m){
//    mode_ = m;
}
