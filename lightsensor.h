#ifndef LIGHTSENSOR_H
#define LIGHTSENSOR_H

#include <QObject>
#include <QDebug>
#include "ucserial.h"

class LightSensor : public QObject
{
    Q_OBJECT

public:
    explicit LightSensor(QObject *parent = nullptr, ucSerial *serial = nullptr);

public slots:
    void readIncommingData();

signals:
    void updateSensorData(QString);

private:
    ucSerial* serial_;

    QByteArray incommingData_;
    QString serialBuffer_;
    QString parsedData_;
};

#endif // LIGHTSENSOR_H
