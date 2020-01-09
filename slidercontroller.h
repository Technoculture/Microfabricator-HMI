#ifndef SLIDERCONTROLLER_H
#define SLIDERCONTROLLER_H

#include <QObject>
#include <QHash>
#include "ucserial.h"

class SliderController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString state READ state WRITE state)
public:
    explicit SliderController(QObject *parent = nullptr, QString port_name = nullptr);

    void state(const QString);
    QString state() const{ return state_; }
    QHash<QString, int> states_;
signals:

private:
    ucSerial* serial_;
    QString state_;
};

#endif // SLIDERCONTROLLER_H
