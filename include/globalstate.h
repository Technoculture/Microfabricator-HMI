#ifndef GLOBALSTATE_H
#define GLOBALSTATE_H

#include <QObject>
#include <QVariantMap>
#include <QDebug>


class globalState : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int currentDrawerIndex   READ currentDrawerIndex WRITE setCurrentDrawerIndex NOTIFY currentDrawerIndexChanged)
    Q_PROPERTY(bool isAllChecksDone     READ isAllChecksDone    WRITE allChecksDone         NOTIFY allChecksDoneChanged)
    Q_PROPERTY(QVariantMap checksModel  READ checksModel        )
//    Q_PROPERTY(bool isAllChecksDone READ isAllChecksDone WRITE allChecksDone NOTIFY allChecksDoneChanged)

public:
    explicit globalState(QObject *parent = nullptr);
    void print();

    int currentDrawerIndex(){ return  currentDrawerIndex_; }
    void setCurrentDrawerIndex(int i){ currentDrawerIndex_ = i; currentDrawerIndexChanged(); }

    bool isAllChecksDone(){ return isAllChecksDone_; }
    void allChecksDone(bool state){ isAllChecksDone_ = state; }

    QVariantMap checksModel(){ return  checksModel_; }
    void setChecksModel(QVariant item);

signals:
    void currentDrawerIndexChanged();
    void allChecksDoneChanged();

private:
    int currentDrawerIndex_ {0};
    bool isAllChecksDone_ {false};

    QVariantMap checksModel_;
    QList<QString> pendingChecksModel;

    const QList<QString> statuses;
};

#endif // GLOBALSTATE_H
