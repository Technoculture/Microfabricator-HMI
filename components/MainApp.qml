import QtQuick 2.0
import "."

Item {
    id: _root
    property alias checklistState: checklist.state
    property bool exposureComplete: false
    property string ufabState: ""

    state: "notVisible"

    onExposureCompleteChanged: {
        if(exposureComplete) {
            statusbar.state = "exposureComplete"
            mainapp.exposureComplete = false
            elapsedDuration = 0
        }
    }

    onUfabStateChanged: {
        if(statusbar.state === "readyToExpose"){
//            console.log("---->"+ufabState)
            if(ufabState === "notVisible" /*|| ufabState === "visibleAtEdge"*/){ exposureelapse.state = "offscreen" }
            else { exposureelapse.state = "onscreen" }
        }
    }

    Checklist {
        id: checklist
        anchors { top: parent.top; bottom: parent.bottom; left: parent.left; right: parent.right }
        onStateChanged: { if(exposureelapse.state == "onscreen") { exposureelapse.state = "offscreen" } }
        onEnabledChanged: {
            if(!checklist.enabled) { checklist.opacity = 0.1 }
            else { checklist.opacity = 1 }
        }
    }

    ExposureElapse { id: exposureelapse }
    StatusBar {
        id: statusbar
        anchors { bottom: _root.bottom; horizontalCenter: _root.horizontalCenter; bottomMargin: statusHeight/2 }
        onStateChanged: {
            if(state === "readyToExpose"){
                checklist.state = "out";
                exposureelapse.state = "onscreen";
            }
        }
        onStartExposure: {
            exposureTimer.start()
            checklist.enabled = false
            checklist.state = "out";
        }
        onGoHome: {
            checklist.enabled = true
            exposureelapse.state = "offscreen"
            checklist._state = "out"
            let checksIndex = [2, 3, 4, 7, 8]
            checksIndex.map(index=>checksModel.set(index, {"status": "pending"}))
        }
        onShutDown: {
            shutDown.shutstate = "onScreen"
            ufabState = "notVisible"
        }
    }
    ShuttingDown { id: shutDown }

    states: [
        State { name: "visible";
            PropertyChanges { target: statusbar; anchors.bottomMargin: statusHeight/2 }
            PropertyChanges { target: checklist; _state: "out" }
        },
        State { name: "notVisible";
            PropertyChanges { target: statusbar; anchors.bottomMargin: -statusHeight/2 }
            PropertyChanges { target: checklist; _state: "notVisible" }
        }
    ]
    transitions: [
        Transition { from: "*"; to: "*";
            NumberAnimation { targets: statusbar; properties: "anchors.bottomMargin"; duration: 300; easing.type: Easing.InOutExpo }
        }
    ]
}
