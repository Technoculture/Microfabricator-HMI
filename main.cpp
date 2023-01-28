#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QFile>
#include <QSqlTableModel>

#include "Settings.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
//    qDebug()<<QDir::currentPath();
    if (!QFile::exists(QStringLiteral("/usr/share/medical-data/medData.db")))
        db.setDatabaseName(QStringLiteral("%1/Labs/medData.db").arg(QDir::currentPath()));
    else
        db.setDatabaseName(QStringLiteral("/usr/share/medical-data/medData.db"));
    db.open();
    Settings settings(nullptr,db);

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
