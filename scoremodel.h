#ifndef SCOREMODEL_H
#define SCOREMODEL_H

#include <QAbstractItemModel>
#include <qqmlintegration.h>

class Score
{
public:
    Score(const QString &participant, const int &points, const int &mark, const int &issuer, const QString &flag);

    QString participant() const;
    int points() const;
    int mark() const;
    int issuer() const;
    QString flag() const;

    void setParticipant(QString participant);
    void setPoints(int points);
    void setMark(int mark);
    void setIssuer(int issuer);
    void setFlag(QString flag);

private:
    QString m_participant;
    int m_points;
    int m_mark;
    int m_issuer;
    QString m_flag;
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
        IssuerRole,
        FlagRole
    };

    //![1]

    void addScore(const Score &score);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    Q_INVOKABLE int rowMarkedCount() const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

    bool setData(const QModelIndex &index, const QVariant &value, int role);

    void clearAllItems();
    Q_INVOKABLE void moveScore(int from, int to);

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<Score> m_scores;


};

#endif // SCOREMODEL_H
