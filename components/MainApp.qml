import QtQuick 2.0
import "."

Item {
    id: _root
    property alias checklistState: checklist.state
    property string ufabState: ""
    property bool exposureComplete: false

    state: "notVisible"

    onExposureCompleteChanged: {
        if(exposureComplete){
            statusbar.state = "exposureComplete"
            mainapp.exposureComplete = false
            elapsedDuration = 0
        }
    }

    onUfabStateChanged: {
        if(statusbar.state === "readyToExpose"){
            if(ufabState === "notVisible"){ exposureelapse.state = "offscreen" }
            else if(ufabState === "visibleNotSplash"){ exposureelapse.state = "onscreen" }
        }
    }

    Checklist {
        id: checklist
        anchors { top: parent.top; bottom: parent.bottom; left: parent.left; right: parent.right }
        onStateChanged: { if(exposureelapse.state == "onscreen") { state = "off" } }
        onEnabledChanged: {
            if(!checklist.enabled){ checklist.opacity = 0.1 }
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
        }
        onGoHome: {
            checklist.enabled = true
            exposureelapse.state = "offscreen"
            checklist._state = "off"
            let checksIndex = [2, 3, 4, 7, 8]
            checksIndex.map(index=>checksModel.set(index, {"status": "pending"}))
        }
    }

    states: [
        State { name: "visible";
            PropertyChanges { target: statusbar; anchors.bottomMargin: statusHeight/2 }
            PropertyChanges { target: checklist; state: "out" }
        },
        State { name: "notVisible";
            PropertyChanges { target: statusbar; anchors.bottomMargin: -statusHeight/2 }
            PropertyChanges { target: checklist; state: "notVisible" }
        }
    ]

    transitions: [
        Transition { from: "*"; to: "*";
            NumberAnimation { targets: statusbar; properties: "anchors.bottomMargin"; duration: 300; easing.type: Easing.InOutExpo }
        }
    ]
}
