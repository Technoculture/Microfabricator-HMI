import QtQuick 2.0
import "."

Item {
    id: _root
    property alias checklistState: checklist.state
    property string ufabState: ""
    property bool exposureComplete: false

    onExposureCompleteChanged: {
        if(exposureComplete){
            statusbar.state = "exposureComplete"
            mainapp.exposureComplete = false
            elapsedDuration = 0
//            exposureDuration = 5
//            pwmIntensity = 100
        }
    }

    onUfabStateChanged: {
        if(statusbar.state === "readyToExpose"){
            if(ufabState === "notVisible"){
                exposureelapse.state = "offscreen"
            } else if(ufabState === "visibleNotSplash"){
                exposureelapse.state = "onscreen"
            }
        }
    }

    Checklist {
        id: checklist
		anchors.fill: parent
        onStateChanged: { if(exposureelapse.state == "onscreen") { state = "off" } }
        onEnabledChanged: {
            if(!checklist.enabled){
                checklist.opacity = 0.1
            } else { checklist.opacity = 1 }
        }
    }

    ExposureElapse {
        id: exposureelapse
    }

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
            exposureelapse.destroy()
            checklist._state = "in"
            checksModel.set(2, {"status": "pending"})
            checksModel.set(3, {"status": "pending"})
            checksModel.set(4, {"status": "pending"})
            checksModel.set(7, {"status": "pending"})
            checksModel.set(8, {"status": "pending"})
        }
    }
}
