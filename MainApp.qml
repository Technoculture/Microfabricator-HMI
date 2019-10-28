import QtQuick 2.0

Item {
    id: _root

    Checklist {
        id: checklist
        anchors.fill: parent
    }

    Item {
        id: exposing
        anchors.fill: parent
        state: "offscreen"

        Progress { id: progress }
        ExposureElapse { id: exposureelapse }

        states: [
            State { name:  "onscreen"; PropertyChanges { target: exposing; visible: true } },
            State { name:  "offscreen"; PropertyChanges { target: exposing; visible: false } }
        ]
    }

    StatusBar {
        anchors { bottom: _root.bottom; horizontalCenter: _root.horizontalCenter; bottomMargin: statusHeight/2 }
        onExpose: { checklist.state = "out"; exposing.state = "onscreen" }
        onExposureComplete: { checklist.visible = false; exposureelapse.state = "center"; progress.state = "off" }
    }
}
