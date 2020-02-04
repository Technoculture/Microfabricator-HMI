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
        color: style.red
        state: {
            if(exposureTimer.running){ "UVON" }
            else if(allChecksDone){ "ALLCHECKDONE" }
            else { "" }
        }

        states: [
            State { name: "UVON"; PropertyChanges { target: bgRect; color: "blue" } },
            State { name: "ALLCHECKDONE"; PropertyChanges { target: bgRect; color: "green" } }
        ]

        transitions: [
            Transition { from: "*"; to: "*";
                ColorAnimation {
                    duration: 800;
                    easing.type: Easing.OutExpo
                } }
        ]
    }

    VibrationPlot { id: vibration; anchors.fill: bgRect; lineColor: "black"; opacity: 0 }
    SplashScreen {
        id: splashscreen
        anchors.fill: bgRect;
        onLoadMainApp: { mainapp.visible = true; }
    }

    MainApp { id: mainapp; anchors.fill: bgRect; visible: true
        ufabState: ufab.state
        onChecklistStateChanged: {
            if(checklistState == "in"){
                ufab.state = "notVisible"
                vibration.opacity = 1
            } else {
                if(allChecksDone){
                    ufab.state = "visibleNotSplash"
                } else {
                    ufab.state = "visible"
                }

                vibration.opacity = 0
            }
        }
    }

    Text {
        id: ufab
        x: 165;
        text: "uFabricator"
        font.pointSize: 70
        font.weight: Font.Thin
        color: "white"
        state: "notVisible"

        states: [
            State { name: "visible"; PropertyChanges { target: ufab; opacity: 1.0 } PropertyChanges { target: ufab; y: 150 }},
            State { name: "visibleNotSplash"; PropertyChanges { target: ufab; opacity: 1.0 } PropertyChanges { target: ufab; y: 150 }},
            State { name: "notVisible"; PropertyChanges { target: ufab; opacity: 0.0 } PropertyChanges { target: ufab; y: -100 }}
        ]

        transitions: [
            Transition { from: "*"; to: "notVisible"; NumberAnimation { target: ufab; properties: "opacity,y"; duration: 500; easing.type: Easing.OutExpo }},
            Transition { from: "*"; to: "visible"; NumberAnimation { target: ufab; properties: "opacity,y"; duration: 1400; easing.type: Easing.InExpo }},
            Transition { from: "*"; to: "visibleNotSplash"; NumberAnimation { target: ufab; properties: "opacity,y"; duration: 550; easing.type: Easing.InExpo }}
        ]
    }

    // GLOBALS
    property int globalCurrentIndex: 0

    property int elapsedDuration: 0
    property int exposureDuration: 5
    property int pwmIntensity: 100

    onElapsedDurationChanged: {
        if(exposureDuration === elapsedDuration){
            exposureTimer.stop()
            mainapp.exposureComplete = true
        }
    }

    Timer {
        id: exposureTimer
        interval: 1000
        running: false
        repeat: true
        onTriggered: { elapsedDuration += 1 }
    }

    ListModel {
        id: checksModel
        ListElement { name: "Light Engine";             status: "pending";       filename:"LightEngineOk" }
        ListElement { name: "Open Tray";             status: "utility";       filename:"TrayOpen" }
        ListElement { name: "Wafer Placed";             status: "ok";  filename:"WaferPlaced" }
        ListElement { name: "Mask Placed";              status: "ok";  filename:"MaskPlaced" }
        ListElement { name: "Wafer-Mask Distance";      status: "ok";  filename:"WaferMaskDistance" }
        ListElement { name: "Close Tray";              status: "utility";       filename:"TrayClosed" }
        ListElement { name: "Vibration Monitor";        status: "ok";       filename:"VibrationMonitor" }
        ListElement { name: "Set Power";                status: "ok";  filename:"SetPower" }
        ListElement { name: "Set Duration";             status: "ok";  filename:"SetDuration" }
    }

    property bool allChecksDone: {(pendingChecksCount() === 0.0) ? true : false}

    ListModel{ id: pendingChecksModel }

    function pendingChecksCount() {
        let pendingCount = 0;
        for(let i = 0; i < checksModel.count;i++) {
            if(checksModel.get(i).status === "pending"){
                pendingChecksModel.append(checksModel.get(i)); pendingCount++; }
        }
        console.log(pendingCount/checksModel.count)
        return pendingCount/checksModel.count;
    }

    function printTime(time) {
        let leftover_t = (time - (time / 1000)).toFixed(0)
        let sec = leftover_t % 60
        let min = (((leftover_t - sec) / 60) % 60)//.toFixed(0)
        return String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0')
    }

    property double pwmEnergy_Multiplier: 0.012 // TODO: dummy
    property double pwmEnergy_Offset: 0.103 // TODO: dummy

    function equivalentEnergy(percentageDuty){
        let energy = (pwmEnergy_Multiplier * percentageDuty) + pwmEnergy_Offset
        return energy.toFixed(2).toString()
    }
}
