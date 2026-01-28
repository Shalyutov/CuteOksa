#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "scoreactor.h"
#include "scoremodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    ScoreModel model;
    model.addScore(Score("Россия", 0, 0, 0));
    model.addScore(Score("Евровидение", 0, 0, 0));

    ScoreActor actor(nullptr, &model);

    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    QQmlContext* context = engine.rootContext();
    context->setContextProperty( "modelv", QVariant::fromValue(&model));
    context->setContextProperty( "actorv", QVariant::fromValue(&actor));
    engine.loadFromModule("untitled1", "Main");

    return app.exec();
}

