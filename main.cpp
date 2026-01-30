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
#include <QString>



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
    ScoreModel juryModel;

    // load countries points

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

    QJsonArray jury = root["jury"].toArray();
    QList<CountryScore> juryScores = QList<CountryScore> ();
    for (const QJsonValue &from : jury){

        CountryScore item;
        item.from = from["from"].toString();
        item.marks = QList<ScoreMark>();

        QJsonArray marks = from["marks"].toArray();
        for (const QJsonValue &mark : marks){
            ScoreMark rec;
            rec.to = mark["to"].toString();
            rec.amount = mark["amount"].toInt();
            item.marks.append(rec);
        }

        juryScores.append(item);
    }

    QJsonArray publicVote = root["public"].toArray();
    QList<CountryScore> publicScores = QList<CountryScore> ();
    for (const QJsonValue &from : publicVote){

        CountryScore item;
        item.from = from["from"].toString();
        item.marks = QList<ScoreMark>();

        QJsonArray marks = from["marks"].toArray();
        for (const QJsonValue &mark : marks){
            ScoreMark rec;
            rec.to = mark["to"].toString();
            rec.amount = mark["amount"].toInt();
            item.marks.append(rec);
        }

        publicScores.append(item);
    }

    //

    ScoreActor actor(nullptr, &model, &juryModel, juryScores, publicScores);

    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    QQmlContext* context = engine.rootContext();
    context->setContextProperty( "modelv", QVariant::fromValue(&model));
    context->setContextProperty( "modelj", QVariant::fromValue(&juryModel));
    context->setContextProperty( "actorv", QVariant::fromValue(&actor));
    engine.loadFromModule("untitled1", "Main");

    return app.exec();
}


