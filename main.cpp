#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "mastercontroller.h"
#include "NavigationController.h"
#include "usersModel.h"
#include "productModel.h"


//#include "test.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //Register a type in QML
    qmlRegisterType<MasterController>("Warehouse.Management", 1,0, "MasterController");
    qmlRegisterType<NavigationController>("Warehouse.Management", 1,0, "NavigationController");
    qmlRegisterType<Users>("Warehouse.Management", 1,0, "Users");
    qmlRegisterType<Product>("Warehouse.Management", 1,0, "Product");

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");
    const QUrl url(QStringLiteral("qrc:/views/MasterView.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

