#ifndef SENSORSCONTROLLER_H
#define SENSORSCONTROLLER_H

#include <QObject>
#include <QHash>
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

    void serialData(QString data){ serialData_ = data; updateSerialData(); }
    QString serialData(){ return serialData_; }
signals:
    void updateSerialData();

private:
    ucSerial* serial_;
    QString mode_;
    QString serialData_;
    QString idleMode_;
};

#endif // SENSORSCONTROLLER_H
