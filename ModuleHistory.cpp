#include "ModuleHistory.h"

#include <QSqlRecord>
#include <QDebug>

ModuleHistory::ModuleHistory(QObject *parent, QSqlDatabase database)
    : QSqlTableModel(parent, database)
{
    setTable(QStringLiteral("moduleHistory"));
    setEditStrategy(QSqlTableModel::OnManualSubmit);
    select();
}

QHash<int, QByteArray> ModuleHistory::roleNames() const
{
    QHash<int, QByteArray> roles;
    for(int i = 0; i < columnCount(); i++){
        roles[Qt::UserRole + 1 + i] = headerData(i, Qt::Horizontal).toByteArray();
//        qDebug()<<roles[Qt::UserRole + 1 + i];
    }
    return roles;
}

QVariant ModuleHistory::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() > rowCount() || role < 0 || role > (columnCount() + Qt::UserRole + 1))
        return QVariant();
    if( role < Qt::UserRole)
        return (QSqlTableModel::data(index, role));
    else
        return QSqlTableModel::data(QSqlTableModel::index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
}

QVariant ModuleHistory::roleFromRow(int row, QString roleName)
{
    QSqlRecord record = QSqlTableModel::record(row);
    return record.value(roleName);
}

void ModuleHistory::removeRow(int row)
{
    removeRows(row, 1, QModelIndex());
    submitAll();
}

void ModuleHistory::addRow(int row, QString newData)
{
    QStringList data = newData.split(";", Qt::KeepEmptyParts);
    QSqlRecord newRecord = record();

    if (row == -1)
        newRecord.setGenerated(QStringLiteral("id"), true);
    else
        newRecord = record(row);

    newRecord.setValue(QStringLiteral("id"), data.at(0));
    newRecord.setValue(QStringLiteral("datetime"), data.at(1));
    newRecord.setValue(QStringLiteral("light_engine"), data.at(2));
    newRecord.setValue(QStringLiteral("stage"), data.at(3));

    if (row == -1)
        insertRecord(row, newRecord);
    else
        setRecord(row, newRecord);

    submitAll();
}
