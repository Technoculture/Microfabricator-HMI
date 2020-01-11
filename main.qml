import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window; visible: true
    minimumWidth: 800; maximumWidth: 800; minimumHeight: 480; maximumHeight: 480;

    UIStyle { id: style }

    Rectangle {
        id: bgRect
        width: 800; height: 480
        anchors.centerIn: parent
        color: allChecksDone ? "green" : style.red
//        gradient: Gradient {
//            id: grad
//            GradientStop {id: startStop; position: pendingChecksCount(); color: Qt.rgba(1-2*pendingChecksCount(),1-pendingChecksCount(),0)}
//            GradientStop {id: endStop; position: 1.0; color: Qt.rgba(0,1-pendingChecksCount(),0)}
//        }
    }

    VibrationPlot { id: vibration; anchors.fill: bgRect; lineColor: "black"; opacity: 0 }
    SplashScreen {
        id: splashscreen
        anchors.fill: bgRect;
        onLoadMainApp: { mainapp.visible = true; }//splashscreen.visible = false; }
    }

    MainApp { id: mainapp; anchors.fill: bgRect; visible: true
        onChecklistStateChanged: {
            if(checklistState == "in"){
                ufab.state = "notVisible"
                vibration.opacity = 1
            } else {
                ufab.state = "visible"
                vibration.opacity = 0
            }
        }
    }

    Text {
        id: ufab
        x: 140;
        text: "uFabricator"
        font.pointSize: 70
        font.weight: Font.Thin
        color: "white"
        state: "notVisible"

        states: [
            State { name: "visible"; PropertyChanges { target: ufab; opacity: 1.0 } PropertyChanges { target: ufab; y: 150 }},
            State { name: "notVisible"; PropertyChanges { target: ufab; opacity: 0.0 } PropertyChanges { target: ufab; y: -100 }}
        ]

        transitions: [
            Transition { from: "visible"; to: "notVisible"; NumberAnimation { target: ufab; properties: "opacity,y"; duration: 500; easing.type: Easing.OutExpo }},
            Transition { from: "notVisible"; to: "visible"; NumberAnimation { target: ufab; properties: "opacity,y"; duration: 500; easing.type: Easing.InExpo }}
        ]
    }

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

    property bool allChecksDone: {(pendingChecksCount() === 0.0) ? true : false}

    ListModel{
        id: pendingChecksModel
    }

    function pendingChecksCount() {
        let pendingCount = 0;
        for(let i = 0; i < checksModel.count;i++) {
            if(checksModel.get(i).status === "pending"){
                pendingChecksModel.append(checksModel.get(i)); pendingCount++; }
        }
        return pendingCount/checksModel.count;
    }
}
