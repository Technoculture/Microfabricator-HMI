#ifndef VIBRATIONSENSOR_H
#define VIBRATIONSENSOR_H

#include <QObject>
#include <QDebug>
#include "ucserial.h"

class VibrationSensor : public QObject
{
    Q_OBJECT

public:
    explicit VibrationSensor(QObject *parent = nullptr, ucSerial* serial = nullptr);

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

#endif // VIBRATIONSENSOR_H
