#include "sensorscontroller.h"

SensorsController::SensorsController(QObject *parent, QString port_name)
    : QObject(parent){
    try { serial_ = new ucSerial(this, port_name); }
    catch (...) { qDebug() << "Failed to Setup communications with SensorsController."; }

    modes_["LIGHT_SENSOR"]          = 1;
    modes_["VIBRATION_SENSOR"]      = 2;
    modes_["TEMPERATURE_SENSOR"]    = 3;
    modes_["SIT_IDLE"]              = 4;

    idleMode_ = modes_["VIBRATION_SENSOR"];
    mode_ = modes_["VIBRATION_SENSOR"];

    qDebug() << "IDLE MODE: " << idleMode_;
}

void SensorsController::mode(const QString m){
    if(modes_.keys().contains(m)){
        mode_ = m;
        unsigned short command = modes_.value(mode_);
        QByteArray m;
        m.setNum(command);
        try { serial_->writeData(m); }
        catch (...) { qDebug() << "Transmission Failed: " << QString(m); }
    } else { qDebug() << "Invalid State: " << QString(m); }
}
