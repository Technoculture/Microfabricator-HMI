import QtQuick 2.12
import QtQuick.Window 2.12
import "./components"
import "."

Window {
    id: window; visible: true
    minimumWidth: 800; maximumWidth: 800; minimumHeight: 480; maximumHeight: 480;

    Rectangle {
        id: bgRect
        width: 800; height: 480
        anchors.centerIn: parent
        color: Style.red
        state: {
            if(exposureTimer.running){ "UVON" }
            else if(allChecksDone){ "ALLCHECKDONE" }
            else { "" }
        }

        states: [
            State { name: "UVON"; PropertyChanges { target: bgRect; color: "dodgerblue"; } },
            State { name: "ALLCHECKDONE"; PropertyChanges { target: bgRect; color: "green" } }
        ]

        transitions: [ Transition { from: "*"; to: "*"; ColorAnimation { duration: 800; easing.type: Easing.OutExpo } } ]
    }

    PowerOnSelfTest { id: post; anchors.fill: bgRect
        Component.onCompleted: { cleanupHardwareResources() }
    }
//    VibrationPlot { id: vibration; anchors.fill: bgRect; lineColor: "black"; opacity: 0 }

    SplashScreen {
        id: splashscreen
        anchors.fill: bgRect;
        waitForCalliberation: !post.calliberationDone

        onLoadMainApp: {
            post.visible = false
            mainapp.checklistState = "out"
            mainapp.state = "visible"
            mainapp.ufabState = "visible"
        }
    }

    MainApp { id: mainapp; anchors.fill: bgRect;
        ufabState: ufab.state
        onChecklistStateChanged: { // FIXME: Here fix ufab text timing
            if(post.calliberationDone){
                if(checklistState == "in"){
                    ufabState = "notVisible"
//                    vibration.opacity = 1
                } else {
                    if(allChecksDone){/* console.log("-> ACD");*/ ufabState = "visibleNotSplash" }
                    else { /*console.log("-> vIB");*/ ufabState = "visible" }
//                    vibration.opacity = 0
                }
            }
        }
        onUfabStateChanged: { ufab.state = ufabState }
    }

    Text {
        id: ufab
        x: 165;
        text: "uFabricator"
        font { pointSize: 70; weight: Font.Thin }
        color: "white"
        state: "notVisible"

        states: [
            State { name: "visible";            PropertyChanges { target: ufab; opacity: 1.0 } PropertyChanges { target: ufab; y: 150 }},
            State { name: "visibleNotSplash";   PropertyChanges { target: ufab; opacity: 1.0 } PropertyChanges { target: ufab; y: 150 }},
            State { name: "visibleIsBack";      PropertyChanges { target: ufab; opacity: 1.0 } PropertyChanges { target: ufab; y: 150 }},
            State { name: "notVisible";         PropertyChanges { target: ufab; opacity: 0.0 } PropertyChanges { target: ufab; y: -100 }},
            State { name: "visibleAtEdge";      PropertyChanges { target: ufab; opacity: 0.3 } PropertyChanges { target: ufab; y: 50 } PropertyChanges { target: ufab; scale: 0.3 }}
        ]

        transitions: [
            Transition { from: "*"; to: "notVisible";       NumberAnimation { target: ufab; properties: "opacity,y"; duration: 500; easing.type: Easing.OutExpo }},
            Transition { from: "*"; to: "visible";          NumberAnimation { target: ufab; properties: "opacity,y"; duration: 500; easing.type: Easing.InExpo }},
            Transition { from: "*"; to: "visibleNotSplash"; NumberAnimation { target: ufab; properties: "opacity,y"; duration: 550; easing.type: Easing.InExpo }},
            Transition { from: "*"; to: "visibleAtEdge";    NumberAnimation { target: ufab; properties: "opacity,y,scale"; duration: 250; easing.type: Easing.OutExpo }},
            Transition { from: "*"; to: "visibleIsBack";    NumberAnimation { target: ufab; properties: "opacity,y,scale"; duration: 200; easing.type: Easing.OutExpo }}
        ]
    }

    // GLOBALS
    property int globalCurrentIndex: 0

    property bool exposing: false
    property int elapsedDuration: 0
    property int exposureDuration: 5
    property int pwmIntensity: 100

    onElapsedDurationChanged: {
        if(exposureDuration === elapsedDuration){
            exposureTimer.stop()
            exposing = false
            mainapp.exposureComplete = true
        }
    }

    Timer {
        id: exposureTimer; running: false; repeat: true
        interval: 1000
        onRunningChanged: { if(running){ exposing = true } /*else { exposing = false } console.log("E " + exposing) }*/}
        onTriggered: { elapsedDuration += 1 }
    }

    ListModel {
        id: checksModel
        ListElement { name: "Light Engine";          status: "ok";        available: "true";    dependsOn:"";                      filename: "LightEngineOk" }
        ListElement { name: "Open Tray";             status: "utility";   available: "true";    dependsOn:"";                      filename: "TrayOpen" }
        ListElement { name: "Calliberate Distance";  status: "pending";   available: "true";    dependsOn:"";                      filename: "CalliberateDistance" }
        ListElement { name: "Wafer Placed";          status: "ok";        available: "false";   dependsOn:"Light Engine";          filename: "WaferPlaced" }
        ListElement { name: "Mask Placed";           status: "ok";        available: "false";   dependsOn:"WaferPlaced";           filename: "MaskPlaced" }
        ListElement { name: "Wafer-Mask Distance";   status: "ok";        available: "false";   dependsOn:"Calliberate Distance";  filename: "WaferMaskDistance" }
        ListElement { name: "Close Tray";            status: "utility";   available: "true";    dependsOn:"";                      filename: "TrayClosed" }
        ListElement { name: "Vibration Monitor";     status: "ok";        available: "true";    dependsOn:"";                      filename: "VibrationMonitor" }
        ListElement { name: "Set Power";             status: "ok";        available: "false";   dependsOn:"Light Engine";          filename: "SetPower" }
        ListElement { name: "Set Duration";          status: "ok";        available: "false";   dependsOn:"Light Engine";          filename: "SetDuration" }
    }

//    ListModel {
//        id: checksModel
//        ListElement { name: "Light Engine";          status: "ok";             filename: "LightEngineOk" }
//        ListElement { name: "Open Tray";             status: "utility";        filename: "TrayOpen" }
//        ListElement { name: "Calliberate Distance";  status: "pending";        filename: "CalliberateDistance" }
//        ListElement { name: "Wafer Placed";          status: "pending";        filename: "WaferPlaced" }
//        ListElement { name: "Mask Placed";           status: "pending";        filename: "MaskPlaced" }
//        ListElement { name: "Wafer-Mask Distance";   status: "pending";        filename: "WaferMaskDistance" }
//        ListElement { name: "Close Tray";            status: "utility";        filename: "TrayClosed" }
//        ListElement { name: "Vibration Monitor";     status: "pending";        filename: "VibrationMonitor" }
//        ListElement { name: "Set Power";             status: "pending";        filename: "SetPower" }
//        ListElement { name: "Set Duration";          status: "pending";        filename: "SetDuration" }
//    }

    property bool allChecksDone: {(pendingChecksCount() === 0) ? true : false}

    ListModel{ id: pendingChecksModel }

    function pendingChecksCount() {
        let pendingCount = 0;
        for(let i = 0; i < checksModel.count;i++) {
            if(checksModel.get(i).status === "pending"){
                pendingChecksModel.append(checksModel.get(i)); pendingCount++; }
        }
        return (pendingCount/checksModel.count.toFixed(1))
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

    function cleanupHardwareResources(){
        uvController.fanState = false
        uvController.pumpState = false
        uvController.intensity = 0
        sliderController.state = "MOVE_INWARDS"
    }
}
