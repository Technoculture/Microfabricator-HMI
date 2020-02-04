import QtQuick 2.0
import "."

Item {
    id: _root
    property alias checklistState: checklist.state
    property string ufabState: ""

    onUfabStateChanged: {
        if(statusbar.state === "readyToExpose"){
            if(ufabState === "notVisible"){
                exposureelapse.state = "offscreen"
            } else if(ufabState === "visible"){
                exposureelapse.state = "onscreen"
            }
        }
    }

    Checklist {
        id: checklist
		anchors.fill: parent
        onStateChanged: { if(exposureelapse.state == "onscreen") { state = "off" } }
    }

    ExposureElapse {
        id: exposureelapse
    }

    StatusBar {
        id: statusbar
        anchors { bottom: _root.bottom; horizontalCenter: _root.horizontalCenter; bottomMargin: statusHeight/2 }
//        onExpose: { checklist.state = "out"; exposing.state = "onscreen" }
//        onExposureComplete: { checklist.visible = false; exposureelapse.state = "center"; }
        onStateChanged: {
            if(state === "readyToExpose"){
                checklist.state = "out";
                exposureelapse.state = "onscreen";
            }
        }
    }
}
