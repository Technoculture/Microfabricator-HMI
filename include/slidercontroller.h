#ifndef SLIDERCONTROLLER_H
#define SLIDERCONTROLLER_H

#include <QObject>
#include <QHash>
#include "ucserial.h"

class SliderController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString state READ state WRITE state)
    Q_PROPERTY(QString hardwareState READ hardwareState NOTIFY updateHardwareState)

public:
    explicit SliderController(QObject *parent = nullptr, QString port_name = nullptr);

    void state(const QString);
    QString state() const{ return state_; }
    QHash<QString, unsigned short> states_;

    QString hardwareState(){ return hardwareState_; }

public slots:
    void readIncommingHardwareState();

signals:
    void updateHardwareState();

private:
    ucSerial* serial_;
    QString state_;
    QString hardwareState_;
    QByteArray incomingSerialBuffer_;
};

#endif // SLIDERCONTROLLER_H
