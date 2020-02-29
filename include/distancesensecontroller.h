#ifndef DISTANCESENSECONTROLLER_H
#define DISTANCESENSECONTROLLER_H

#include <QObject>
#include <QHash>
#include <QByteArray>
#include "ucserial.h"

class DistanceSenseController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString serialData READ serialData WRITE serialData NOTIFY updateSerialData)

public:
    explicit DistanceSenseController(QObject *parent = nullptr, QString = nullptr);
    QString serialData(){ return parsedData_; }

public slots:
    void readIncommingData();
    void serialData(QString data){ parsedData_ = data; qDebug() << "SensorsController:serialData -> New Data -> " << data; updateSerialData(); }

signals:
    void updateSerialData();

private:
    ucSerial* serial_;

    QByteArray incommingData_;
    QString serialBuffer_;
    QString parsedData_;
};

#endif // DISTANCESENSECONTROLLER_H
