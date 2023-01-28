#include "Settings.h"

#include <QSqlRecord>
#include <QDebug>

Settings::Settings(QObject *parent, QSqlDatabase database)
    : QSqlTableModel(parent, database)
{
    setTable(QStringLiteral("history"));
    setEditStrategy(QSqlTableModel::OnManualSubmit);
    select();
}

QHash<int, QByteArray> Settings::roleNames() const
{
    QHash<int, QByteArray> roles;
    for(int i = 0; i < columnCount(); i++)
        roles[Qt::UserRole + 1 + i] = headerData(i, Qt::Horizontal).toByteArray();
    return roles;
}

QVariant Settings::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() > rowCount() || role < 0 || role > (columnCount() + Qt::UserRole + 1))
        return QVariant();
    if( role < Qt::UserRole)
        return (QSqlTableModel::data(index, role));
    else
        return QSqlTableModel::data(QSqlTableModel::index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
}

QVariant Settings::roleFromRow(int row, QString roleName)
{
    QSqlRecord record = QSqlTableModel::record(row);
    return record.value(roleName);
}

void Settings::removeRow(int row)
{
    removeRows(row, 1, QModelIndex());
    submitAll();
}

void Settings::addRow(int row, QString newData)
{
    QStringList data = newData.split(";", Qt::KeepEmptyParts);
    QSqlRecord newRecord = record();

    if (row == -1)
        newRecord.setGenerated(QStringLiteral("id"), true);
    else
        newRecord = record(row);

    newRecord.setValue(QStringLiteral("id"), data.at(0));
    newRecord.setValue(QStringLiteral("date"), data.at(1));
    newRecord.setValue(QStringLiteral("message"), data.at(2));
    newRecord.setValue(QStringLiteral("time"), data.at(3));
    newRecord.setValue(QStringLiteral("type"), data.at(4));
    newRecord.setValue(QStringLiteral("duration"), data.at(5));
    newRecord.setValue(QStringLiteral("light_intensity"), data.at(6));
    newRecord.setValue(QStringLiteral("wafer_stage"), data.at(7));
    newRecord.setValue(QStringLiteral("wm_clamp"), data.at(8));
    newRecord.setValue(QStringLiteral("vibration"), data.at(9));

    if (row == -1)
        insertRecord(row, newRecord);
    else
        setRecord(row, newRecord);

    submitAll();
}
