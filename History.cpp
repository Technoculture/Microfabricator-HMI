#include "History.h"

#include <QSqlRecord>
#include <QDebug>

History::History(QObject *parent, QSqlDatabase database)
    : QSqlTableModel(parent, database)
{
    setTable(QStringLiteral("history"));
    setEditStrategy(QSqlTableModel::OnManualSubmit);
    select();
}

QHash<int, QByteArray> History::roleNames() const
{
    QHash<int, QByteArray> roles;
    for(int i = 0; i < columnCount(); i++){
        roles[Qt::UserRole + 1 + i] = headerData(i, Qt::Horizontal).toByteArray();
//        qDebug()<<roles[Qt::UserRole + 1 + i];
    }
    return roles;
}

QVariant History::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() > rowCount() || role < 0 || role > (columnCount() + Qt::UserRole + 1))
        return QVariant();
    if( role < Qt::UserRole)
        return (QSqlTableModel::data(index, role));
    else
        return QSqlTableModel::data(QSqlTableModel::index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
}

QVariant History::roleFromRow(int row, QString roleName)
{
    QSqlRecord record = QSqlTableModel::record(row);
    return record.value(roleName);
}

void History::removeRow(int row)
{
    removeRows(row, 1, QModelIndex());
    submitAll();
}

void History::addRow(int row, QString newData)
{
    QStringList data = newData.split(";", QString::KeepEmptyParts);
    QSqlRecord newRecord = record();

    if (row == -1)
        newRecord.setGenerated(QStringLiteral("id"), true);
    else
        newRecord = record(row);

    newRecord.setValue(QStringLiteral("message"), data.at(0));
    newRecord.setValue(QStringLiteral("time"), data.at(1));
    newRecord.setValue(QStringLiteral("type"), data.at(2));
    newRecord.setValue(QStringLiteral("wafer_stage"), data.at(3));
    newRecord.setValue(QStringLiteral("wafer_clamp"), data.at(4));
    newRecord.setValue(QStringLiteral("wafer_mask_gap"), data.at(5));
    newRecord.setValue(QStringLiteral("vibration"), data.at(6));
    newRecord.setValue(QStringLiteral("duration"), data.at(7));
    newRecord.setValue(QStringLiteral("light_intensity"), data.at(8));

    if (row == -1)
        insertRecord(row, newRecord);
    else
        setRecord(row, newRecord);

    submitAll();
    qDebug()<<"Database Updated: " << newRecord;
}
