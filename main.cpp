#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QFile>
#include <QQmlContext>
#include <QSqlTableModel>

#include "History.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
    if (!QFile::exists(QStringLiteral("/usr/share/tcr/mfab.db")))
        db.setDatabaseName(QStringLiteral("%1/mfab.db").arg(QDir::currentPath()));
    else
        db.setDatabaseName(QStringLiteral("/usr/share/tcr/mfab.db"));
    db.open();
    History history(nullptr,db);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("historyTable", &history);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
