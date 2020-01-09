#ifndef SENSORSCONTROLLER_H
#define SENSORSCONTROLLER_H

#include <QObject>
#include <QHash>
#include "ucserial.h"

class SensorsController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString mode READ mode WRITE mode)
public:
    explicit SensorsController(QObject *parent = nullptr, QString = nullptr);

    void mode(const QString);
    QString mode() const{ return mode_; }
    QHash<QString, int> modes_;
signals:

private:
    ucSerial* serial_;
    QString mode_;
};

#endif // SENSORSCONTROLLER_H
