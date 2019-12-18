#ifndef GPIO_FAN_PUMP_H
#define GPIO_FAN_PUMP_H

#include <QObject>
#include <QFile>
#include <QDebug>
#include <QTextStream>
#include <QVector>

class GPIO_Fan_Pump : public QObject
{
    Q_OBJECT
public:
    explicit GPIO_Fan_Pump(QObject *parent = nullptr);
    void setState(bool);

signals:

private:
    bool _state = false;
    void define_pin(QString direction = "out");


};

#endif // GPIO_FAN_PUMP_H
