#ifndef UCSERIAL_H
#define UCSERIAL_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QByteArray>
#include <QDebug>

class ucSerial : public QObject
{
    Q_OBJECT
public:
    explicit ucSerial(QObject *parent = nullptr,
                      const QString& = nullptr);
    void writeData(QByteArray&);
    bool retryConnecting(){ return openSerialPort(portName_); }
    bool isConnected(){ return isConnected_; }
    QSerialPort* serial;
signals:

private:
    QString portName_ = "";
    bool isConnected_ = false;
    bool openSerialPort(const QString&);
};

#endif
