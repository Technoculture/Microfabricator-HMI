#ifndef SENSORSCONTROLLER_H
#define SENSORSCONTROLLER_H

#include <QObject>
#include <QHash>
#include <QByteArray>
#include "ucserial.h"

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

    QString serialData(){ return parsedData_; }


public slots:
    void readIncommingData();
    void serialData(QString data){ parsedData_ = data; qDebug() << "SensorsController:serialData -> New Data -> " << data; updateSerialData(); }

signals:
    void updateSerialData();

private:
    QString mode_;
    QString idleMode_;

    ucSerial* serial_;

    QByteArray incommingData_;
    QString serialBuffer_;
    QString parsedData_;
};

#endif // SENSORSCONTROLLER_H
