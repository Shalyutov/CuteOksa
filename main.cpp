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
#include <QMap>

#include <QApplication>
#include <QFileDialog>
#include <QWidget>
#include <QWindow>

int main(int argc, char *argv[])
{
    //pizdec nakhuj blyat
    bool dw = true;
    QApplication* fa = new  QApplication(argc, argv);
    QWidget* w = new QWidget();
    QFileDialog dialog(w);
    QString filename;
    QObject::connect(
        &dialog,
        &QFileDialog::fileSelected,
        [&]() { w->close(); filename = dialog.selectedFiles().at(0) ; dw = false; });

    int i = dialog.exec();
    if (i == 0) dw = false;
    w->close();
    while (dw) {
        fa->processEvents();
    }
    delete fa;

    if (filename.isEmpty())
        exit(0);

    QGuiApplication app(argc, argv);

    ScoreModel model;
    ScoreModel juryModel;
    QMap<QString, QString> countryFlags = QMap<QString, QString>();

    QString val;
    QFile file(filename); //":/res/score.json"
    if (!file.open(QIODevice::ReadOnly))
        qWarning() << "error file open";
    val = file.readAll();
    file.close();
    QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());
    QJsonObject root = d.object();

    QJsonArray countries = root["countries"].toArray();
    int j = 1;
    for (const QJsonValue &country : std::as_const(countries)){
        countryFlags[country["name"].toString()] = country["flag"].toString();
        model.addScore(Score(country["name"].toString(), 0, 0, 0, country["flag"].toString(), j));
        j++;
    }

    for (int i = 0; i < 13; i++) {
        juryModel.addScore(Score("", 0, 0, 0, "", i+1));
    }

    QJsonArray jury = root["jury"].toArray();
    QList<CountryScore> juryScores = QList<CountryScore> ();
    for (const QJsonValue &from : std::as_const(jury)){

        CountryScore item;
        item.from = from["from"].toString();
        item.marks = QList<ScoreMark>();

        QJsonArray marks = from["marks"].toArray();
        for (const QJsonValue &mark : std::as_const(marks)){
            ScoreMark rec;
            rec.to = mark["to"].toString();
            rec.amount = mark["amount"].toInt();
            item.marks.append(rec);
        }

        juryScores.append(item);
    }

    QJsonArray publicVote = root["public"].toArray();
    QList<CountryScore> publicScores = QList<CountryScore> ();
    for (const QJsonValue &from : std::as_const(publicVote)){

        CountryScore item;
        item.from = from["from"].toString();
        item.marks = QList<ScoreMark>();

        QJsonArray marks = from["marks"].toArray();
        for (const QJsonValue &mark : std::as_const(marks)){
            ScoreMark rec;
            rec.to = mark["to"].toString();
            rec.amount = mark["amount"].toInt();
            item.marks.append(rec);
        }

        publicScores.append(item);
    }
    //

    ScoreActor actor(nullptr, &model, &juryModel, juryScores, publicScores, countryFlags, root["highMark"].toInt());

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


