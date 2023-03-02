#include "gpio.h"

#include <QDebug>
#include <QFileSystemWatcher>

Gpio::Gpio(const QString& gpioNumber, Gpio::LineDirection direction)
    : m_state(Gpio::Low)
    , m_direction(direction)
    , m_gpioNumber(gpioNumber)
    , m_valueFile(QString("/sys/class/gpio/gpio" + m_gpioNumber + "/value"))
    , m_watcher(new QFileSystemWatcher(this))
{
    QFile exportFile("/sys/class/gpio/export");
    if (!exportFile.open(QIODevice::WriteOnly | QIODevice::Text))
        qWarning() << "cannot open " << exportFile.fileName();
    exportFile.write(QByteArray(m_gpioNumber.toLatin1()));
    exportFile.close();
    QFile directionFile("/sys/class/gpio/gpio" + gpioNumber + "/direction");
    if (!directionFile.open(QIODevice::WriteOnly))
        qWarning() << "cannot open " << directionFile.fileName();
    QByteArray rw = (m_direction == LineDirection::In) ? QByteArray("in") : QByteArray("out");
    directionFile.write(rw);
    directionFile.close();

    if (m_direction == LineDirection::In) {
        QFile edgeFile("/sys/class/gpio/gpio" + gpioNumber + "/edge");
        if (!edgeFile.open(QIODevice::WriteOnly))
            qWarning() << "cannot open " << edgeFile.fileName();
        edgeFile.write(QByteArray("both"));
        edgeFile.close();

        if (m_valueFile.exists())
            m_watcher->addPath(m_valueFile.fileName());
        connect(m_watcher, &QFileSystemWatcher::fileChanged, this, &Gpio::updateGpio);
    }
}
Gpio::~Gpio()
{
    QFile exportFile("/sys/class/gpio/unexport");
    if (!exportFile.open(QIODevice::WriteOnly | QIODevice::Text))
        qWarning() << "cannot open " << exportFile.fileName();
    exportFile.write(QByteArray(m_gpioNumber.toLatin1()));
    exportFile.close();
}

Gpio::LineState Gpio::lineState() const
{
    return m_state;
}
void Gpio::setLineState(LineState state)
{
    if (m_direction == LineDirection::In)
        return;

    if (state != m_state) {
        m_state = state;
        updateGpio();
    }
}
void Gpio::updateGpio()
{
    if (m_direction == LineDirection::In) {
        if (!m_valueFile.open(QIODevice::ReadOnly)) {
            qWarning() << "cannot open " << m_valueFile.fileName();
            return;
        }
        int newState = m_valueFile.readAll().toInt();
        m_valueFile.close();
        if (LineState(newState) == m_state)
            return;
        m_state = LineState(newState);
        Q_EMIT lineStateChanged(m_state);
    }
    else {
        if (!m_valueFile.open(QIODevice::WriteOnly | QIODevice::Text)) {
            qWarning() << "cannot open " << m_valueFile.fileName();
            return;
        }
        if (m_state == High)
            m_valueFile.write(QByteArray("1"));
        else
            m_valueFile.write(QByteArray("0"));
        m_valueFile.close();
    }
}
