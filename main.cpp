#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "uvfanpumpcontroller.h"
#include "slidercontroller.h"
#include "sensorscontroller.h"

int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    }

    QApplication app(argc, argv);

    // ===================================
    UvFanPumpController* UVControl = new UvFanPumpController(&app, "/dev/ttyUSB0");
    SliderController* SliderControl = new SliderController(&app, "/dev/ttyUSB2");
    SensorsController* SensorControl = new SensorsController(&app, "/dev/ttyUSB1");
    // ===================================

    QQmlApplicationEngine engine;

    // CONTEXT PROPERTY ====================================
    engine.rootContext()->setContextProperty("uvController", UVControl);
    engine.rootContext()->setContextProperty("sliderController", SliderControl);
    engine.rootContext()->setContextProperty("sensorController", SensorControl);
    // =====================================================

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
