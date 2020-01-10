#include "vibrationsensor.h"

VibrationSensor::VibrationSensor(QObject *parent, ucSerial* serial) : QObject(parent), serial_(serial){
    connect(this, SIGNAL(updateSensorData(QString)), parent, SLOT(serialData(QString)));
}

void VibrationSensor::readIncommingData(){
    QStringList buffer_split = serialBuffer_.split(";");
    if(buffer_split.length() < 35){ // no parsed value yet so continue accumulating bytes from serial in the buffer.
        incommingData_ = serial_->serial->readAll();
        serialBuffer_ = serialBuffer_ + QString::fromStdString(incommingData_.toStdString());
        incommingData_.clear(); }
    else{ // the second element of buffer_split is parsed correctly, update the temperature value on temp_lcdNumber
        serialBuffer_ = "";
        qDebug() << buffer_split << "\n";
        parsedData_ = buffer_split[1];
        updateSensorData(parsedData_); }
}
