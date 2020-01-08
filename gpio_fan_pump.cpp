#include "gpio_fan_pump.h"

GPIO_Fan_Pump::GPIO_Fan_Pump(QObject *parent) :
    QObject(parent), _state(false)
{
    setState(_state);
    qDebug() << "GPIO SETTING UP: " << _state;
    QProcess::execute("cd /sys/class/gpio && echo 23 > export");
    QProcess::execute("echo out > gpio23/direction");
}

void GPIO_Fan_Pump::setState(bool newState=true)
{
    if(newState != _state) {
        _state = newState;
        qDebug() << "GPIO STATE CHANGED: " << _state;
        QProcess::execute("echo 1 > gpio23/value");
    }
}
