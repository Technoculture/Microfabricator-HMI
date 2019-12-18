#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "gpio_fan_pump.h"
#include "ucserial.h"

int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    }

//    // ---GPIO--------------
//    GPIO_Fan_Pump gpio;
//    gpio.setState(true);
//    gpio.setState(true);
//    gpio.setState(true);
//    gpio.setState(false);
//    // ---------------------

    QGuiApplication app(argc, argv);

    ucSerial* uv_uc = new ucSerial(&app);
    uv_uc->sendCommand(20);


    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
