import QtQuick 2.0

Item {
    state: "offscreen"

    Rectangle {
        id: baseRect
        anchors.fill: parent

        Text {
            id: timeLabel
            text: "Time Remaining"
            color: "black"
            font.pixelSize: 18
            x: 155; y: 245
        }
        Text {
            id: time
            anchors.top: timeLabel.bottom
            anchors.left: timeLabel.left
            text: "02:20:34"
            color: "white"
            font.pixelSize: 22
        }
        Text {
            anchors.top: timeLabel.bottom
            anchors.left: time.right
            text: " / 03:00:00"
            color: "#003f00"
            font.pixelSize: 22
        }
        Text {
            id: percent
            text: "78"
            font.pixelSize: 90
            color: "#00c302"
            x: 615
            y: 35
        }
        Text {
            anchors.left: percent.right
            anchors.bottom: percent.bottom
            anchors.bottomMargin: 12
            color: "#00c302"
            text: "%"
            font.pixelSize: 30
        }
        Text {
            id: intensityLabel
            text: "Intensity"
            color: "black"
            x: 535; y: 242
            font.pixelSize: 18
        }
        Text {
            id: energy
            anchors.top: intensityLabel.bottom
            anchors.right: intensityLabel.right
            text: " ~1.45mJ"
            color: "#003f00"
            font.pixelSize: 22
        }
        Text {
            anchors.right: energy.left
            anchors.bottom: energy.bottom
            text: "80%"
            color: "white"
            font.pixelSize: 22
        }
    }

    states: [
        State { name:  "onscreen"; PropertyChanges { target: baseRect; opacity: 1.0 } },
        State { name:  "offscreen"; PropertyChanges { target: baseRect; opacity: 0.0 } }
    ]

    transitions: [
        Transition { from: "*"; to: "onscreen"; NumberAnimation { properties: "opacity"; duration: 800; easing.type: Easing.InExpo } },
        Transition { from: "*"; to: "offscreen"; NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.OutExpo } }
    ]
}
