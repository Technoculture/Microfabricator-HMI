#include "ucserial.h"

ucSerial::ucSerial(QObject *parent) : QObject(parent)
{
    serial->setPortName("/dev/ttyUSB0");
    serial->setBaudRate(QSerialPort::Baud9600);
    serial->setDataBits(QSerialPort::Data8);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);
    serial->setFlowControl(QSerialPort::NoFlowControl);

    if (serial->open(QIODevice::ReadWrite)) {
       qDebug() << "CONNECTED!!!";

    } else {
       qDebug() << "Open error NOT CONNECTED!!!";
    }
}

void ucSerial::sendCommand(uint intensity){
    QByteArray m;
    m.setNum(intensity);
    serial->write(m);
}
