#include "include/distancesensecontroller.h"

DistanceSenseController::DistanceSenseController(QObject *parent, QString port_name) : QObject(parent) {
    serial_ = new ucSerial(this, port_name);
    connect(serial_->serial, SIGNAL(readyRead()), this, SLOT(readIncommingData()));
}

void DistanceSenseController::readIncommingData(){
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
