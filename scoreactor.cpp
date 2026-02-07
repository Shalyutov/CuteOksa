#include "scoreactor.h"

void ScoreActor::reorder() {
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

void ScoreActor::countMarked(){
    int count = 0;
    for (int i = 0; i < m_jurymodel->rowCount(); i++) {
        QModelIndex idx = m_jurymodel->index(i);
        if (m_jurymodel->data(idx, ScoreModel::MarkRole).toInt() > 0 && m_jurymodel->data(idx, ScoreModel::IssuerRole).toInt() == 0){
            count++;
        }
    }
    setMarkedCount(count);
}

void ScoreActor::juryReveal(){
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
            setcurrentVote(m_jury[_current].from);
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
        countMarked();
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
        for (int i = 0; i < m_jurymodel->rowCount(); i++) {
            QModelIndex idxu = m_jurymodel->index(i);
            m_jurymodel->setData(idxu, 0, ScoreModel::MarkRole);
            m_jurymodel->setData(idxu, 0, ScoreModel::IssuerRole);
        }
        countMarked();
    }
}

void ScoreActor::publicReveal(){
    if (_jury) {
        return;
    }
    if (_current < 0){
        return;
    }
    if (!ready) {
        setreadyP(true);
        QModelIndex idx;
        for (int i = m_scoremodel->rowCount() - 1; i > 0; i--) {
            QModelIndex idxn = m_scoremodel->index(i);
            if (m_scoremodel->data(idxn, ScoreModel::IssuerRole).toInt() == 1 && m_scoremodel->data(idxn, ScoreModel::MarkRole).toInt() < 0){
                setcurrentVote(m_scoremodel->data(idxn, ScoreModel::ParticipantRole).toString());
                break;
            }
        }
        return;
    }
    QModelIndex idx;
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

void ScoreActor::reset(){
    setcurrentP(0);
    setjuryP(true);
    setreadyP(false);
    setreadyHighP(false);
    setgiveMarksP(false);
    setgiveHighMarkP(false);
    setjuryCount(m_jury.count());
    for (int i = 0; i < m_scoremodel->rowCount(); i++) {
        QModelIndex idx = m_scoremodel->index(i);
        m_scoremodel->setData(idx, 0, ScoreModel::PointsRole);
        m_scoremodel->setData(idx, 0, ScoreModel::MarkRole);
        m_scoremodel->setData(idx, 0, ScoreModel::IssuerRole);
    }
    for (int i = 0; i < m_jurymodel->rowCount(); i++) {
        QModelIndex idxu = m_jurymodel->index(i);
        m_jurymodel->setData(idxu, 0, ScoreModel::MarkRole);
        m_jurymodel->setData(idxu, 0, ScoreModel::IssuerRole);
    }
    countMarked();
}
