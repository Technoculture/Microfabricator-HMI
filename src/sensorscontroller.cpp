#include "include/sensorscontroller.h"

SensorsController::SensorsController(QObject *parent, QString port_name) : QObject(parent) {
    serial_ = new ucSerial(this, port_name);

    modes_["TEMPERATURE_SENSOR"]    = 1;
    modes_["VIBRATION_SENSOR"]      = 2;
    modes_["LIGHT_SENSOR"]          = 3;
    modes_["SIT_IDLE"]              = 4;

    idleMode_ = modes_["VIBRATION_SENSOR"];
    mode("VIBRATION_SENSOR");

    connect(serial_->serial, SIGNAL(readyRead()), this, SLOT(readIncommingData()));
}

void SensorsController::readIncommingData(){
    QStringList buffer_split = serialBuffer_.split(";");
    if(buffer_split.length() < 2){ // no pased value yet so continue accumulating bytes from serial in the buffer.
        incommingData_ = (serial_->serial)->readAll();
        serialBuffer_ = serialBuffer_ + QString::fromStdString(incommingData_.toStdString());
        incommingData_.clear(); }
    else{ // the second element of buffer_split is parsed correctly, update the value
        serialBuffer_ = "";
        parsedData_ = buffer_split[1];
        updateSerialData(); }
}

void SensorsController::mode(QString m) {
    if(modes_.keys().contains(m)){
        mode_ = m;
        unsigned short command = modes_.value(mode_);
        QByteArray m;
        m.setNum(command);
        try { serial_->writeData(m); }
        catch (...) { qDebug() << "Transmission Failed: " << QString(m); }}
    else { qDebug() << "Invalid State: " << QString(m); }
}

