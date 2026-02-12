#include "scoremodel.h"

Score::Score(const QString &participant, const int &points, const int &mark, const int &issuer, const QString &flag, const int &order)
    : m_participant(participant), m_points(points), m_mark(mark), m_issuer(issuer), m_flag(flag), m_order(order)
{
}

QString Score::participant() const
{
    return m_participant;
}

int Score::points() const
{
    return m_points;
}

int Score::mark() const
{
    return m_mark;
}

int Score::issuer() const
{
    return m_issuer;
}

int Score::order() const
{
    return m_order;
}

QString Score::flag() const
{
    return m_flag;
}

void Score::setParticipant(QString participant)
{
    m_participant = participant;
}

void Score::setPoints(int points)
{
    m_points = points;
}

void Score::setMark(int mark)
{
    m_mark = mark;
}

void Score::setIssuer(int issuer)
{
    m_issuer = issuer;
}

void Score::setFlag(QString flag)
{
    m_flag = flag;
}

void Score::setOrder(int order)
{
    m_order = order;
}

ScoreModel::ScoreModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void ScoreModel::addScore(const Score &score)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_scores << score;
    endInsertRows();
}

int ScoreModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_scores.count();
}

int ScoreModel::rowMarkedCount() const {
    int count = 0;
    for (auto &score : std::as_const(m_scores)){
        if (score.mark() > 0 && score.issuer() == 0){
            count++;
        }
    }
    return count;
}

QVariant ScoreModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_scores.count())
        return QVariant();

    const Score &score = m_scores[index.row()];
    if (role == ParticipantRole)
        return score.participant();
    else if (role == PointsRole)
        return score.points();
    else if (role == MarkRole)
        return score.mark();
    else if (role == IssuerRole)
        return score.issuer();
    else if (role == FlagRole)
        return score.flag();
    else if (role == OrderRole)
        return score.order();
    return QVariant();
}

//![0]
QHash<int, QByteArray> ScoreModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[ParticipantRole] = "participant";
    roles[PointsRole] = "points";
    roles[MarkRole] = "mark";
    roles[IssuerRole] = "issuer";
    roles[FlagRole] = "flag";
    roles[OrderRole] = "order";
    return roles;
}
//![0]


bool ScoreModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }

    switch (role) {
    case ParticipantRole:
        m_scores[index.row()].setParticipant(value.toString());
        break;
    case PointsRole:
        m_scores[index.row()].setPoints(value.toInt());
        break;
    case MarkRole:
        m_scores[index.row()].setMark(value.toInt());
        break;
    case IssuerRole:
        m_scores[index.row()].setIssuer(value.toInt());
        break;
    case FlagRole:
        m_scores[index.row()].setFlag(value.toString());
        break;
    case OrderRole:
        m_scores[index.row()].setOrder(value.toInt());
        break;
    default:
        return false;
    }

    emit dataChanged(index, index, QVector<int>() << role);

    return true;
}

void ScoreModel::clearAllItems()
{
    beginResetModel();
    m_scores.clear();
    endResetModel();
}

void ScoreModel::moveScore(int from, int to)
{
    if(from>=0 && from<m_scores.count() && to >= 0 && to<m_scores.count() && from != to)
    {
        beginMoveRows(QModelIndex(),from,from,QModelIndex(),to);
        m_scores.move(from, to);
        endMoveRows();
    }
}
