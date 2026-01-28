#ifndef SCOREACTOR_H
#define SCOREACTOR_H

#endif // SCOREACTOR_H

#include "scoremodel.h"

#include <QObject>

class ScoreActor : public QObject
{
    Q_OBJECT
public:
    explicit ScoreActor (QObject* parent = 0, ScoreModel* scores = nullptr) : QObject(parent), m_scoremodel(scores) {}
    Q_INVOKABLE void start(){
        if (m_scoremodel != nullptr) {
            m_scoremodel->setData(m_scoremodel->index(0), 12, ScoreModel::PointsRole);
            m_scoremodel->setData(m_scoremodel->index(1), 10, ScoreModel::PointsRole);
        }
    }

protected:
    ScoreModel* m_scoremodel;
};
