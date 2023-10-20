#ifndef GPIO_H
#define GPIO_H

#include <QObject>
#include <QFile>
#include <QFileSystemWatcher>

class Gpio : public QObject {
   Q_OBJECT
public:
   enum LineState { Low, High };
   enum LineDirection { In, Out };
   explicit Gpio(const QString& gpioNumber, Gpio::LineDirection direction);
   ~Gpio();
   Gpio::LineState lineState() const;
   void setLineState(Gpio::LineState state);
signals:
   void lineStateChanged(Gpio::LineState lineState);
private:
   void updateGpio();
   LineState m_state;
   LineDirection m_direction;
   QString m_gpioNumber;
   QFile m_valueFile;
   QFileSystemWatcher* m_watcher = nullptr;
};

#endif // GPIO_H
