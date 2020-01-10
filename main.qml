import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window; visible: true
    width: 800; height: 480// minimumWidth: 800; maximumWidth: 800; minimumHeight: 480; maximumHeight: 480;

    UIStyle { id: style }

    Rectangle {
        id: bgRect
        width: 800; height: 480
        anchors.centerIn: parent
        color: style.red//style.green//"red"//style.grey
    }

    VibrationPlot {
        anchors.fill: bgRect
        Component.onCompleted: {
            sensorController.mode = "LIGHT_SENSOR"
        }
    }

    SplashScreen {
        id: splashscreen
        anchors.fill: bgRect;
        onLoadMainApp: { mainapp.visible = true; }//splashscreen.visible = false; }
    }

    MainApp { id: mainapp; anchors.fill: bgRect; visible: true}//false }


    // GLOBALS
    property int globalCurrentIndex: 0

    ListModel {
        id: checksModel
        ListElement { name: "Light Engine";             status: "ok";       filename:"LightEngineOk" }
        ListElement { name: "Wafer Placed";             status: "pending";  filename:"WaferPlaced" }
        ListElement { name: "Mask Placed";              status: "pending";  filename:"MaskPlaced" }
        ListElement { name: "Wafer-Mask Distance";      status: "pending";  filename:"WaferMaskDistance" }
        ListElement { name: "Tray Closed";              status: "ok";       filename:"TrayClosed" }
        ListElement { name: "Vibration Monitor";        status: "ok";       filename:"VibrationMonitor" }
        ListElement { name: "Set Power";                status: "pending";  filename:"SetPower" }
        ListElement { name: "Set Duration";             status: "pending";  filename:"SetDuration" }
    }

//    property int pendingChecksCount: {
//        countPendingChecks();
//    }

//    function countPendingChecks(){
//        let pendingCount = 0;
//        if(checksModel.get(i).status === "pending"){
//            pendingCount++;
//        }
//        }
//        console.log(pendingCount);
//        return pendingCount;
//    }
}
