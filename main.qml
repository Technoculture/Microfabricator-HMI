import QtQuick 2.12
import QtQuick.Window 2.12
import "./components"

Window {
    id: window; visible: true
    minimumWidth: 800; maximumWidth: 800; minimumHeight: 480; maximumHeight: 480;

    UIStyle { id: style }

    Rectangle {
        id: bgRect
        width: 800; height: 480
        anchors.centerIn: parent
        color: allChecksDone ? "green" : style.red
    }

    VibrationPlot { id: vibration; anchors.fill: bgRect; lineColor: "black"; opacity: 0 }
    SplashScreen {
        id: splashscreen
        anchors.fill: bgRect;
        onLoadMainApp: { mainapp.visible = true; } //splashscreen.visible = false; }
    }

    MainApp { id: mainapp; anchors.fill: bgRect; visible: true
        ufabState: ufab.state
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
        x: 150;
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
        ListElement { name: "Light Engine";             status: "pending";       filename:"LightEngineOk" }
        ListElement { name: "Wafer Placed";             status: "ok";  filename:"WaferPlaced" }
        ListElement { name: "Mask Placed";              status: "ok";  filename:"MaskPlaced" }
        ListElement { name: "Wafer-Mask Distance";      status: "ok";  filename:"WaferMaskDistance" }
        ListElement { name: "Tray Closed";              status: "ok";       filename:"TrayClosed" }
        ListElement { name: "Vibration Monitor";        status: "ok";       filename:"VibrationMonitor" }
        ListElement { name: "Set Power";                status: "ok";  filename:"SetPower" }
        ListElement { name: "Set Duration";             status: "ok";  filename:"SetDuration" }
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
