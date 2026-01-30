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

signals:
    void giveMarksPChanged();
    void giveHighMarkPChanged();
    void juryPChanged();
    void currentPChanged();

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
        if (_current > m_jury.length()-1) {
            setjuryP(false);
            return;
        }

        if (!giveMarks && !giveHighMark) {
            //m_jurymodel->removeRows(0, m_jurymodel->rowCount(), m_jurymodel->index(0));
            m_jurymodel->clearAllItems();

            for (const ScoreMark &mark : m_jury[_current].marks){
                if (mark.amount == 12) {
                    high = mark;
                    continue;
                }
                m_jurymodel->addScore(Score(mark.to, 0, mark.amount, 0));

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
            for (int i = 0; i < m_scoremodel->rowCount(); i++) {
                QModelIndex idx = m_scoremodel->index(i);
                if (m_scoremodel->data(idx, ScoreModel::ParticipantRole).toString() == high.to) {
                    m_scoremodel->setData(idx, high.amount, ScoreModel::MarkRole);
                    m_scoremodel->setData(idx, 0, ScoreModel::IssuerRole);

                    int sum = m_scoremodel->data(idx, ScoreModel::PointsRole).toInt() + high.amount;
                    m_scoremodel->setData(idx, sum, ScoreModel::PointsRole);
                }
            }
            giveHighMark = true;
        }
        else if (giveMarks && giveHighMark) {
            setcurrentP(_current+1);
            setgiveMarksP(false);
            setgiveHighMarkP(false);
            for (int i = 0; i < m_scoremodel->rowCount(); i++) {
                QModelIndex idx = m_scoremodel->index(i);
                m_scoremodel->setData(idx, 0, ScoreModel::MarkRole);
                m_scoremodel->setData(idx, 0, ScoreModel::IssuerRole);
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
    bool giveMarks = false;
    bool giveHighMark = false;
    ScoreMark high;
};
