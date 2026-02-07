#ifndef SCOREACTOR_H
#define SCOREACTOR_H

#endif // SCOREACTOR_H

#include "scoremodel.h"

#include <QObject>

struct ScoreMark {
    QString to;
    int amount;
};

struct CountryScore {
public:
    QString from;
    QList<ScoreMark> marks;
};

class ScoreActor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int giveMarksP READ giveMarksP WRITE setgiveMarksP NOTIFY giveMarksPChanged)
    Q_PROPERTY(int giveHighMarkP READ giveHighMarkP WRITE setgiveHighMarkP NOTIFY giveHighMarkPChanged)
    Q_PROPERTY(int juryP READ juryP WRITE setjuryP NOTIFY juryPChanged)
    Q_PROPERTY(int currentP READ currentP WRITE setcurrentP NOTIFY currentPChanged)
    Q_PROPERTY(int readyP READ readyP WRITE setreadyP NOTIFY readyPChanged)
    Q_PROPERTY(int readyHighP READ readyHighP WRITE setreadyHighP NOTIFY readyHighPChanged)
    Q_PROPERTY(int markedCount READ markedCount WRITE setMarkedCount NOTIFY markedCountChanged)
    Q_PROPERTY(QString currentVote READ currentVote WRITE setcurrentVote NOTIFY currentVoteChanged)
    Q_PROPERTY(int juryCount READ juryCount WRITE setjuryCount NOTIFY juryCountChanged)

signals:
    void giveMarksPChanged();
    void giveHighMarkPChanged();
    void juryPChanged();
    void currentPChanged();
    void readyPChanged();
    void readyHighPChanged();
    void markedCountChanged();
    void currentVoteChanged();
    void juryCountChanged();

private:
    void reorder();
    void countMarked();

public:
    explicit ScoreActor (QObject* parent = 0,
                        ScoreModel* scores = nullptr,
                        ScoreModel* juryModel = nullptr,
                        QList<CountryScore> juryScores = QList<CountryScore> (),
                        QList<CountryScore> publicScores = QList<CountryScore> (),
                        QMap<QString, QString> countryFlags = QMap<QString, QString>()) :
        QObject(parent),
        m_scoremodel(scores),
        m_jurymodel(juryModel),
        m_jury(juryScores),
        m_public(publicScores),
        m_countryFlags(countryFlags)
    {
        reset();
    }

    bool giveMarksP(){
        return giveMarks;
    }

    bool giveHighMarkP(){
        return giveHighMark;
    }

    bool juryP(){
        return _jury;
    }

    bool readyP(){
        return ready;
    }

    bool readyHighP(){
        return readyHigh;
    }

    int currentP(){
        return _current;
    }

    int markedCount() {
        return _markedCount;
    }

    QString currentVote() {
        return _currentVote;
    }

    int juryCount() {
        return _juryCount;
    }

    void setgiveMarksP(const bool &arg){
        if(giveMarks != arg)
        {
            giveMarks = arg;
            emit giveMarksPChanged();
        }
    }

    void setgiveHighMarkP(const bool &arg){
        if(giveHighMark != arg)
        {
            giveHighMark = arg;
            emit giveHighMarkPChanged();
        }
    }

    void setjuryP(const bool &arg){
        if(_jury != arg)
        {
            _jury = arg;
            emit juryPChanged();
        }
    }

    void setreadyP(const bool &arg){
        if(ready != arg)
        {
            ready = arg;
            emit readyPChanged();
        }
    }

    void setreadyHighP(const bool &arg){
        if(readyHigh != arg)
        {
            readyHigh = arg;
            emit readyPChanged();
        }
    }

    void setcurrentP(const int &arg){
        if(_current != arg)
        {
            _current = arg;
            emit currentPChanged();
        }
    }

    void setMarkedCount(const int &arg){
        if(_markedCount != arg)
        {
            _markedCount = arg;
            emit markedCountChanged();
        }
    }

    void setcurrentVote(const QString &arg){
        if(_currentVote != arg)
        {
            _currentVote = arg;
            emit currentVoteChanged();
        }
    }

    void setjuryCount(const int &arg){
        if(_juryCount != arg)
        {
            _juryCount = arg;
            emit juryCountChanged();
        }
    }

    Q_INVOKABLE void juryReveal();

    Q_INVOKABLE void publicReveal();

    Q_INVOKABLE void reset();

protected:
    ScoreModel* m_scoremodel;
    ScoreModel* m_jurymodel;
    QList<CountryScore> m_jury;
    QList<CountryScore> m_public;
    QMap<QString, QString> m_countryFlags;
    int _current = 0;
    int _markedCount = 0;
    int _juryCount = 0;
    bool _jury = true;
    bool ready = false;
    bool readyHigh = false;
    bool giveMarks = false;
    bool giveHighMark = false;
    QString _currentVote;
    ScoreMark high;
};
