#ifndef SENSORSCONTROLLER_H
#define SENSORSCONTROLLER_H

#include <QObject>
#include <QHash>
#include <QByteArray>
#include "ucserial.h"
#include "vibrationsensor.h"
#include "lightsensor.h"

class SensorsController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString mode READ mode WRITE mode)
    Q_PROPERTY(QString serialData READ serialData WRITE serialData NOTIFY updateSerialData)

public:
    explicit SensorsController(QObject *parent = nullptr, QString = nullptr);

    void mode(const QString);
    QString mode() const{ return mode_; }
    QHash<QString, unsigned short> modes_;

    void modeChanged();

    QString serialData(){ return serialData_; }

public slots:
    void serialData(QString data){ serialData_ = data; updateSerialData(); }

signals:
    void updateSerialData();

private:
    QString mode_;
    QString idleMode_;

    VibrationSensor* vSensor;
    LightSensor* lSensor;

    ucSerial* serial_;
    QString serialData_;
};

#endif // SENSORSCONTROLLER_H
