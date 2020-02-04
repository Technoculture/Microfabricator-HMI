#include "include/globalstate.h"

globalState::globalState(QObject *parent) : QObject(parent){
//    checksModel_["Light Engine"]         = {"pending", "LightEngineOk"};
//    checksModel_["Wafer Placed"]         = {"pending", "WaferPlaced"};
//    checksModel_["Mask Placed"]          = {"pending", "MaskPlaced"};
//    checksModel_["Wafer-Mask Distance"]  = {"pending", "WaferMaskDistance"};
//    checksModel_["Tray Closed"]          = {"pending", "TrayClosed"};
//    checksModel_["Vibration Monito"]     = {"pending", "VibrationMonitor"};
//    checksModel_["Set Power"]            = {"pending", "SetPower"};
//    checksModel_["Set Duration"]         = {"pending", "SetDuration"};

//    for(auto item:checksModel_.keys()){
//        if(checksModel_[item][0] == "pending")
//            pendingChecksModel.append(item);
//    }

    print();
}

//void globalState::setChecksModel(QString item, QString status){
//    if(checksModel_.keys().contains(item) && QList<QString>("pending", "ok").contains(status))
//        checksModel_[item][0] = status;
//}

void globalState::print(){
    for(auto item:pendingChecksModel){
        qDebug() << item;
    }
}
