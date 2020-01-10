#include "uvfanpumpcontroller.h"

UvFanPumpController::UvFanPumpController(QObject *parent, QString port_name): QObject(parent){
    serial_ = new ucSerial(this, port_name);
}

void UvFanPumpController::fanState(bool state){
    fanState_ = state;
    QByteArray m;
    if(state){ m.setNum(223); }
    else { m.setNum(224); }
    serial_->writeData(m);
}

void UvFanPumpController::pumpState(bool state){
    pumpState_ = state;
    QByteArray m;
    if(state){ m.setNum(225); }
    else { m.setNum(226); }
    serial_->writeData(m);
}

void UvFanPumpController::intensity(unsigned short intensity){
    if( intensity <= 100){ //intensity >= 0
        lightIntensity_ = intensity;
        QByteArray m;
        if(intensity == 0){ m.setNum(222); }
        else { m.setNum(intensity); }
        serial_->writeData(m);
    } else{ qDebug() << "Invalid Intensity"; }
}
