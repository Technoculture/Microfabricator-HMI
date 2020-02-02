#include "include/ucserial.h"

ucSerial::ucSerial(QObject *parent, const QString& DEVICE_NAME) : QObject(parent)
{
    USB_DEVICES["SENSORS_CONTROLLER"]    = "/dev/com_sensors";
    USB_DEVICES["SLIDER_CONTROLLER"]     = "/dev/com_slider";
    USB_DEVICES["UVFANPUMP_CONTROLLER"]  = "/dev/com_uvfanpump";

    portName_ = findPortName(DEVICE_NAME);
    serial = new QSerialPort(this);
    if(portName_ != ""){ isConnected_ = openSerialPort(portName_); }
}

QString ucSerial::findPortName(const QString& device_name){
    // TODO: If DEVICE_NAME in QHash USB_DEVICES
    // TODO: Get its port adress from linux and mutate portName_ with it
    if(USB_DEVICES.contains(device_name)){
        return USB_DEVICES[device_name];
    } else { qDebug() << "USB DEVICE not name found."; return ""; }
}

bool ucSerial::openSerialPort(const QString& port_name)
{
    serial->setPortName(port_name);
    serial->setBaudRate(QSerialPort::Baud115200);
    serial->setDataBits(QSerialPort::Data8);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);
    serial->setFlowControl(QSerialPort::NoFlowControl);

    if (serial->open(QIODevice::ReadWrite)){
        qDebug() << port_name << ": CONNECTED!";
        return true; }
    else {
        qDebug() << port_name << ": NOT CONNECTED!";
        return false; }
}

void ucSerial::writeData(QByteArray &data)
{
    if(isConnected_){
        constexpr char enter = '\12';
        data.append(enter);
        serial->write(data);
        qDebug() << data;
    } else { qDebug() << "Failed to transmit command: " << data; }
}
