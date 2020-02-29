#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "include/uvfanpumpcontroller.h"
#include "include/slidercontroller.h"
#include "include/sensorscontroller.h"
#include "include/distancesensecontroller.h"

int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    }

    QApplication app(argc, argv);

    // ===================================
    UvFanPumpController* UVControl = new UvFanPumpController(&app, "UVFANPUMP_CONTROLLER");
    SliderController* SliderControl = new SliderController(&app, "SLIDER_CONTROLLER");
    SensorsController* SensorControl = new SensorsController(&app, "SENSORS_CONTROLLER");
    DistanceSenseController* DistSenseControl = new DistanceSenseController(&app, "DISTSENSE_CONTROLLER");
    // ===================================

    QQmlApplicationEngine engine;

    // CONTEXT PROPERTY ====================================
    engine.rootContext()->setContextProperty("uvController", UVControl);
    engine.rootContext()->setContextProperty("sliderController", SliderControl);
    engine.rootContext()->setContextProperty("sensorController", SensorControl);
    engine.rootContext()->setContextProperty("distsenseController", DistSenseControl);
    // WARNING: ContextProperty replace with RegisterType
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
