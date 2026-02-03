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

signals:
    void giveMarksPChanged();
    void giveHighMarkPChanged();
    void juryPChanged();
    void currentPChanged();
    void readyPChanged();
    void readyHighPChanged();

public:
    explicit ScoreActor (QObject* parent = 0,
                        ScoreModel* scores = nullptr,
                        ScoreModel* juryModel = nullptr,
                        QList<CountryScore> juryScores = QList<CountryScore> (),
                        QList<CountryScore> publicScores = QList<CountryScore> ()) :
        QObject(parent),
        m_scoremodel(scores),
        m_jurymodel(juryModel),
        m_jury(juryScores),
        m_public(publicScores)
    {

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



    /////////////

    Q_INVOKABLE void start(){
        if (m_scoremodel != nullptr) {
            m_scoremodel->setData(m_scoremodel->index(0), 12, ScoreModel::PointsRole);
            m_scoremodel->setData(m_scoremodel->index(1), 10, ScoreModel::PointsRole);
        }
    }

    Q_INVOKABLE void juryReveal(){
        if (!_jury) {
            return;
        }
        if (_current > m_jury.length()-1) {
            setjuryP(false);
            setreadyP(false);
            setcurrentP(m_scoremodel->rowCount() - 1);
            for (int i = 0; i < m_scoremodel->rowCount(); i++) {
                QModelIndex idx = m_scoremodel->index(i);
                m_scoremodel->setData(idx, -1, ScoreModel::MarkRole);
                m_scoremodel->setData(idx, 1, ScoreModel::IssuerRole);
            }
            return;
        }

        if (!giveMarks && !giveHighMark) {
            if (!ready) {
                setreadyP(true);
                return;
            }
            int p = 0;
            for (const ScoreMark &mark : std::as_const(m_jury[_current].marks)){
                if (mark.amount == 12) {
                    high = mark;
                    continue;
                }
                QModelIndex bbv = m_scoremodel->index(p);
                m_jurymodel->setData(bbv, mark.to, ScoreModel::ParticipantRole);
                m_jurymodel->setData(bbv, 0, ScoreModel::IssuerRole);
                m_jurymodel->setData(bbv, mark.amount, ScoreModel::MarkRole);
                p++;

                for (int i = 0; i < m_scoremodel->rowCount(); i++) {
                    QModelIndex idx = m_scoremodel->index(i);
                    if (m_scoremodel->data(idx, ScoreModel::ParticipantRole).toString() == mark.to) {
                        m_scoremodel->setData(idx, mark.amount, ScoreModel::MarkRole);
                        m_scoremodel->setData(idx, 0, ScoreModel::IssuerRole);

                        int sum = m_scoremodel->data(idx, ScoreModel::PointsRole).toInt() + mark.amount;
                        m_scoremodel->setData(idx, sum, ScoreModel::PointsRole);
                    }
                }
            }

            setgiveMarksP(true);
        }
        else if (giveMarks && !giveHighMark) {
            if (!readyHigh) {
                setreadyHighP(true);
                reorder();
                return;
            }
            for (int i = 0; i < m_scoremodel->rowCount(); i++) {
                QModelIndex idx = m_scoremodel->index(i);
                if (m_scoremodel->data(idx, ScoreModel::ParticipantRole).toString() == high.to) {
                    m_scoremodel->setData(idx, high.amount, ScoreModel::MarkRole);
                    m_scoremodel->setData(idx, 0, ScoreModel::IssuerRole);

                    int sum = m_scoremodel->data(idx, ScoreModel::PointsRole).toInt() + high.amount;
                    m_scoremodel->setData(idx, sum, ScoreModel::PointsRole);
                }
            }
            setgiveHighMarkP(true);
            reorder();
        }
        else if (giveMarks && giveHighMark) {
            setcurrentP(_current+1);
            setgiveMarksP(false);
            setgiveHighMarkP(false);
            setreadyP(false);
            setreadyHighP(false);
            for (int i = 0; i < m_scoremodel->rowCount(); i++) {
                QModelIndex idx = m_scoremodel->index(i);
                m_scoremodel->setData(idx, 0, ScoreModel::MarkRole);
                m_scoremodel->setData(idx, 0, ScoreModel::IssuerRole);
            }
        }
    }

    Q_INVOKABLE void publicReveal(){
        if (_jury) {
            return;
        }
        if (_current < 0){
            return;
        }
        if (!ready) {
            setreadyP(true);
            /*for (int i = 0; i < m_scoremodel->rowCount(); i++) {
                QModelIndex idx = m_scoremodel->index(i);
                m_scoremodel->setData(idx, 0, ScoreModel::MarkRole);
                m_scoremodel->setData(idx, 0, ScoreModel::IssuerRole);
            }*/
            return;
        }
        QModelIndex idx;// = m_scoremodel->index(_current);
        bool find = false;
        for (int i = m_scoremodel->rowCount() - 1; i > 0; i--) {
            QModelIndex idxn = m_scoremodel->index(i);
            if (m_scoremodel->data(idxn, ScoreModel::IssuerRole).toInt() == 1 && m_scoremodel->data(idxn, ScoreModel::MarkRole).toInt() < 0){
                find = true;
                idx = idxn;
                break;
            }
        }
        if (!find){
            return;
        }

        int sum = 0;
        for (int i = 0; i < m_public.count(); i++){
            for (const ScoreMark &mark : std::as_const(m_public[i].marks)) {
                if (m_scoremodel->data(idx, ScoreModel::ParticipantRole).toString() == mark.to) {
                    sum += mark.amount;
                }
            }
        }
        int total = m_scoremodel->data(idx, ScoreModel::PointsRole).toInt() + sum;
        m_scoremodel->setData(idx, total, ScoreModel::PointsRole);
        m_scoremodel->setData(idx, sum, ScoreModel::MarkRole);
        m_scoremodel->setData(idx, 1, ScoreModel::IssuerRole);
        reorder();
        setcurrentP(_current - 1);
        setreadyP(false);
    }

    void reorder() {
        for (int curr = 0; curr < m_scoremodel->rowCount(); curr++) {
            int max = -1;
            int maxIdx = -1;
            for (int i = curr; i < m_scoremodel->rowCount(); i++) {
                QModelIndex idx = m_scoremodel->index(i);
                int points = m_scoremodel->data(idx, ScoreModel::PointsRole).toInt();
                if (points > max) {
                    max = points;
                    maxIdx = i;
                }
            }
            if (max != -1 && max != 0){
                m_scoremodel->moveScore(maxIdx, curr);
            }
        }
    }

    Q_INVOKABLE void reset(){
        _current = 0;
        setjuryP(true);
        setgiveMarksP(false);
        setgiveHighMarkP(false);
    }

protected:
    ScoreModel* m_scoremodel;
    ScoreModel* m_jurymodel;
    QList<CountryScore> m_jury;
    QList<CountryScore> m_public;
    int _current = 0;
    bool _jury = true;
    bool ready = false;
    bool readyHigh = false;
    bool giveMarks = false;
    bool giveHighMark = false;
    ScoreMark high;
};
