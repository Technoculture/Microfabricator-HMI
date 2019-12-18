#ifndef UCSERIAL_H
#define UCSERIAL_H

#include <QObject>
#include <QSerialPort>
#include <QFile>
#include <QDebug>

class ucSerial : public QObject
{
    Q_OBJECT
public:
    explicit ucSerial(QObject *parent = nullptr);
    void sendCommand(uint);

signals:

private:
    QSerialPort* serial;

};

#endif // UCSERIAL_H
