#ifndef UCSERIAL_H
#define UCSERIAL_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QFile>
#include <QByteArray>
#include <QDebug>

class ucSerial : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int intensity READ Intensity WRITE setIntensity)
public:
    explicit ucSerial(QObject *parent = nullptr);
    void setIntensity(const unsigned short intensity);
    int Intensity() const { return intensity_; }
signals:

private:
    unsigned short intensity_;
    QSerialPort* serial;

    void openSerialPort();
    void writeData(QByteArray&);
};

#endif
