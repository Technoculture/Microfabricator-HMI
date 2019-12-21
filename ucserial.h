#ifndef UCSERIAL_H
#define UCSERIAL_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QFile>
#include <QDebug>
#include <QByteArray>

class ucSerial : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int intensity WRITE setIntensity NOTIFY intensityChanged)
public:
    explicit ucSerial(QObject *parent = nullptr);
    void setIntensity(int intensity);

signals:

private:
    QSerialPort* serial;

    void openSerialPort();
    void writeData(QByteArray&);
};

#endif // UCSERIAL_H
