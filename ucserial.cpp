#include "ucserial.h"

ucSerial::ucSerial(QObject *parent, const QString& port_name) : QObject(parent)
{
    serial = new QSerialPort(this);
    openSerialPort(port_name);
}

void ucSerial::openSerialPort(const QString& port_name)
{
    serial->setPortName(port_name);
    serial->setBaudRate(QSerialPort::Baud115200);
    serial->setDataBits(QSerialPort::Data8);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);
    serial->setFlowControl(QSerialPort::NoFlowControl);

    if (serial->open(QIODevice::ReadWrite)){ qDebug() << port_name << ": CONNECTED!"; }
    else { qDebug() << port_name << ": NOT CONNECTED!"; }
}

void ucSerial::writeData(QByteArray &data)
{
    constexpr char enter = '\12';
    data.append(enter);
    serial->write(data);
    qDebug() << data;
}
