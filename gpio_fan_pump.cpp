#include "gpio_fan_pump.h"

GPIO_Fan_Pump::GPIO_Fan_Pump(QObject *parent) :
    QObject(parent), _state(false)
{
    setState(_state);
    qDebug() << "GPIO SETTING UP: " << _state;
}

void GPIO_Fan_Pump::setState(bool newState=true)
{
    if(newState != _state) {
        _state = newState;
        qDebug() << "GPIO STATE CHANGED: " << _state;

        // ----
        QFile gpioExport("/sys/class/gpio/export");
        if(!gpioExport.open(QIODevice::WriteOnly | QIODevice::Text)){
            qDebug() << "File Error! (GPIO)";
            return;
        }
        QTextStream exportStream(&gpioExport);
        exportStream << 23 << "\n";
        exportStream << 24 << "\n";
        exportStream << 25 << "\n";
        qDebug() << "Pins Exported";

        gpioExport.close();
        qDebug() << "File closed";
        // ----


        // ----
        QFile dgpio23("/sys/class/gpio/gpio23/direction");
        QFile dgpio24("/sys/class/gpio/gpio24/direction");
        QFile dgpio25("/sys/class/gpio/gpio25/direction");

        if(!dgpio23.open(QIODevice::WriteOnly | QIODevice::Text)){
            qDebug() << "File Error! (GPIO)";
        }
        if(!dgpio24.open(QIODevice::WriteOnly | QIODevice::Text)){
            qDebug() << "File Error! (GPIO)";
        }
        if(!dgpio25.open(QIODevice::WriteOnly | QIODevice::Text)){
            qDebug() << "File Error! (GPIO)";
        }

        QTextStream sGpio23(&dgpio23);
        QTextStream sGpio24(&dgpio24);
        QTextStream sGpio25(&dgpio25);

        sGpio23 << "out";
        sGpio24 << "out";
        sGpio25 << "out";
        // ----

        QFile vgpio23("/sys/class/gpio/gpio23/value");
        QFile vgpio24("/sys/class/gpio/gpio24/value");
        QFile vgpio25("/sys/class/gpio/gpio25/value");

        QTextStream vsGpio23(&dgpio23);
        QTextStream vsGpio24(&dgpio24);
        QTextStream vsGpio25(&dgpio25);

        vsGpio23 << 1;
        vsGpio24 << 1;
        vsGpio25 << 0;
    }
    else
        return;
}
