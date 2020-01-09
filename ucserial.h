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
signals:

private:
    QSerialPort* serial;
    void openSerialPort(const QString&);
};

#endif
