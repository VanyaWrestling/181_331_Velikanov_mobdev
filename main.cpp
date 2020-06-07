#include <QApplication>
//#include <QIcon>
#include "httpcontroller.h"
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "mailmodel.h"
#include "cryptocontroller.h"
#include <QtCharts/QChartView>
#include <QtCharts/QBarSet>
#include <QtCharts/QLegend>


QT_CHARTS_USE_NAMESPACE

int main(int argc, char *argv[])
{
    CryptoController test;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    HttpController httpcontroller;
    httpcontroller.getSiteValue();

    QQmlApplicationEngine engine;
    test.setPath(app.applicationDirPath());


    QQmlContext *context = engine.rootContext();
    context->setContextProperty("httpcontroller", &httpcontroller); // поместить с++ объект в область видимости движка qml
    context->setContextProperty("mail_model", httpcontroller.mail_model); //Перемещаемая модель, которой присваиваем имя
    context->setContextProperty("qhttpcontroller", &httpcontroller);
    context->setContextProperty("test", &test);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject * mw = engine.rootObjects().first();
    QObject::connect (mw, SIGNAL(makeRequest()),
                      &httpcontroller, SLOT(getSiteValue()));
    QObject::connect(engine.rootObjects().first(), SIGNAL(restRequest()),
    &httpcontroller, SLOT(restRequest()));

    QObject::connect(engine.rootObjects().first(), SIGNAL(hashMD5(QString)),
    &httpcontroller, SLOT(hashMD5(QString)));

    QObject::connect(engine.rootObjects().first(), SIGNAL(token(QString)),
    &httpcontroller, SLOT(token(QString)));

    return app.exec();
}
