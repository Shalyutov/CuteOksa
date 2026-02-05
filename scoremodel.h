#ifndef SCOREMODEL_H
#define SCOREMODEL_H

#include <QAbstractItemModel>
#include <qqmlintegration.h>

class Score
{
public:
    Score(const QString &participant, const int &points, const int &mark, const int &issuer);

    QString participant() const;
    int points() const;
    int mark() const;
    int issuer() const;

    void setParticipant(QString participant);
    void setPoints(int points);
    void setMark(int mark);
    void setIssuer(int issuer);

private:
    QString m_participant;
    int m_points;
    int m_mark;
    int m_issuer;
};

class ScoreModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit ScoreModel(QObject *parent = nullptr);

    enum ScoreRoles {
        ParticipantRole = Qt::UserRole + 1,
        PointsRole,
        MarkRole,
        IssuerRole
    };

    //![1]

    void addScore(const Score &score);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    Q_INVOKABLE int rowMarkedCount() const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    bool setData(const QModelIndex &index, const QVariant &value, int role);

    bool removeRows(int row, int count, const QModelIndex &parent);
    void clearAllItems();
    Q_INVOKABLE void moveScore(int from, int to);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Score> m_scores;


};

#endif // SCOREMODEL_H
