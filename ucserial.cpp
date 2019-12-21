#include "ucserial.h"

ucSerial::ucSerial(QObject *parent) : QObject(parent)
{
    serial = new QSerialPort(this);
    openSerialPort();
}

void ucSerial::setIntensity(int intensity)
{
    QByteArray m;
    m.setNum(intensity);
    writeData(m);
}

void ucSerial::openSerialPort()
{
    serial->setPortName("/dev/ttyUSB0");
    serial->setBaudRate(QSerialPort::Baud9600);
    serial->setDataBits(QSerialPort::Data8);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);
    serial->setFlowControl(QSerialPort::NoFlowControl);

    if (serial->open(QIODevice::ReadWrite))
    {
        qDebug() << "CONNECTED!";
    }
    else
    {
        qDebug() << "NOT CONNECTED!";
        //Open error
    }
}

void ucSerial::writeData(QByteArray &data)
{
    const char enter = '\12';
    data.append(enter);
    serial->write(data);
    qDebug() << data;
}
