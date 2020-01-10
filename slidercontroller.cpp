#include "slidercontroller.h"

SliderController::SliderController(QObject *parent, QString port_name) : QObject(parent){
    try { serial_ = new ucSerial(this, port_name); }
    catch (...) { qDebug() << "Failed to Setup communications with SliderController."; }

    states_["MOVE_OUTWARDS"]    = 1;
    states_["MOVE_INWARDS"]     = 2;
    states_["STOP_MIDWAY"]      = 3;
    states_["SIT_IDLE"]         = 4;
}

void SliderController::state(const QString s){
    if(states_.keys().contains(s)){
        state_ = s;
        unsigned short command = states_.value(state_);
        QByteArray m;
        m.setNum(command);
        try { serial_->writeData(m); }
        catch (...) { qDebug() << "Transmission Failed: " << QString(m); }
    } else { qDebug() << "Invalid State: " << QString(s); }
}
