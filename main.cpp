#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QJsonDocument>
#include "scoreactor.h"
#include "scoremodel.h"
#include <QFile>
#include <QList>
#include <QJsonObject>
#include <QJsonArray>

struct ScoreMark {
    QString to;
    int amount;
};

struct CountryScore {
    QString from;
    QList<ScoreMark> marks;
};

void loadResults () {
    QString val;
    QFile file(":/res/score.json");
    if (!file.open(QIODevice::ReadOnly))
        return;
    val = file.readAll();
    file.close();
    QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());
    QJsonObject root = d.object();

    QJsonArray countries = root["countries"].toArray();
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    ScoreModel model;
    //model.addScore(Score("Россия", 0, 0, 0));
    //model.addScore(Score("Евровидение", 0, 0, 0));

    //

    QString val;
    QFile file(":/res/score.json");
    if (!file.open(QIODevice::ReadOnly))
        qWarning() << "error file open";
    val = file.readAll();
    file.close();
    QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());
    QJsonObject root = d.object();

    QJsonArray countries = root["countries"].toArray();
    for (const QJsonValue &country : countries){
        model.addScore(Score(country.toString(), 0, 0, 0));
    }
    //

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


