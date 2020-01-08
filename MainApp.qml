import QtQuick 2.0

Item {
    id: _root

    Checklist {
        id: checklist
		anchors.fill: parent
        onStateChanged: { if(exposing.state == "onscreen") { state = "off" } }
    }

    Item {
        id: exposing
        anchors.fill: parent
        state: "offscreen"

        Progress { id: progress; checklistState: checklist._state }
        ExposureElapse { id: exposureelapse; checklistState: checklist._state }

        states: [
            State { name:  "onscreen"; PropertyChanges { target: exposing; visible: true } },
            State { name:  "offscreen"; PropertyChanges { target: exposing; visible: false } }
        ]

//        transitions: [
//            Transition {
//                from: "*"
//                to: "*"

//                NumberAnimation {
//                    targets: ["exposing.progress"]
//                    properties: "x"
//                    duration: 1000
//                }
//            }
//        ]
    }

    StatusBar {
        anchors { bottom: _root.bottom; horizontalCenter: _root.horizontalCenter; bottomMargin: statusHeight/2 }
        onExpose: { checklist.state = "out"; exposing.state = "onscreen" }
        onExposureComplete: { checklist.visible = false; exposureelapse.state = "center"; progress.state = "off" }
    }
}
