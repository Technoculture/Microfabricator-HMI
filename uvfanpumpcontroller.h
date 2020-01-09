#ifndef UVFANPUMPCONTROLLER_H
#define UVFANPUMPCONTROLLER_H

#include <QObject>
#include "ucserial.h"

class UvFanPumpController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int intensity READ intensity WRITE intensity)
    Q_PROPERTY(bool fanState READ fanState WRITE fanState)
    Q_PROPERTY(bool pumpState READ pumpState WRITE pumpState)
public:
    explicit UvFanPumpController(QObject *parent = nullptr, QString = nullptr);

    void fanState(bool state);
    void pumpState(bool state);
    void intensity(const unsigned short);

    bool fanState() const { return fanState_; }
    bool pumpState() const { return pumpState_; }
    int intensity() const { return lightIntensity_; }
signals:

private:
    ucSerial* serial_;
    bool fanState_;
    bool pumpState_;
    unsigned short lightIntensity_;

};

#endif // UVFANPUMPCONTROLLER_H
