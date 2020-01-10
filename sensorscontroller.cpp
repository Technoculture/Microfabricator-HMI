#include "sensorscontroller.h"

SensorsController::SensorsController(QObject *parent, QString port_name) : QObject(parent) {
    serial_ = new ucSerial(this, port_name);

    modes_["LIGHT_SENSOR"]          = 1;
    modes_["VIBRATION_SENSOR"]      = 2;
    modes_["TEMPERATURE_SENSOR"]    = 3;
    modes_["SIT_IDLE"]              = 4;

    idleMode_ = modes_["VIBRATION_SENSOR"];
    mode_ = modes_["VIBRATION_SENSOR"]; //qDebug() << "IDLE MODE: " << idleMode_;

    vSensor = new VibrationSensor(this);
    lSensor = new LightSensor(this);
//    tSensor = new TemperatureSensor(this);

    connect(serial_->serial, SIGNAL(readyRead()),
            vSensor, SLOT(readIncommingData()));
}

void SensorsController::modeChanged(){
    disconnect(serial_->serial, SIGNAL(readyRead()));
    switch (modes_[mode_]) {
    case 1:
        connect(serial_->serial, SIGNAL(readyRead()),
                lSensor, SLOT(readIncommingData()));
        break;
    case 2:
        connect(serial_->serial, SIGNAL(readyRead()),
                vSensor, SLOT(readIncommingData()));
        break;
    case 3: // connect(serial_->serial, SIGNAL(readyRead()), tSensor, SLOT(readIncommingData())); break;
    default:
        break;
    }
}

void SensorsController::mode(const QString m) {
    if(modes_.keys().contains(m)){
        unsigned short command = modes_.value(mode_);
        QByteArray m;
        m.setNum(command);
        try { serial_->writeData(m); mode_ = m; modeChanged(); }
        catch (...) { qDebug() << "Transmission Failed: " << QString(m); }}
    else { qDebug() << "Invalid State: " << QString(m); }
}

