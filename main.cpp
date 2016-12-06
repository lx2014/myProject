#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/QMLControl.qml")));
//    QQuickView viewer;
//    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
//    viewer.setSource(QUrl("qrc:///main.qml"));
//    viewer.show();

    return app.exec();
}

//#include "shared.h"
//DECLARATIVE_EXAMPLE_MAIN(FirstPage)
