import QtQuick 2.0

Item {
    id: _root
    property int timeRemaining: { exposureDuration - elapsedDuration }
    property int totalTime: exposureDuration
    property int intensity: pwmIntensity

    state: "offscreen"

    Rectangle {
        id: baseRect
        anchors.fill: parent

        Text {
            id: timeLabel
            text: "Time Remaining"
            color: "black"
            font.pixelSize: 18
            x: 170; y: 245
        }
        Text {
            id: time
            anchors.top: timeLabel.bottom
            anchors.left: timeLabel.left
            text: printTime(timeRemaining) //}// "02:20:34" //{
            color: "white"
            font.pixelSize: 22
        }
        Text {
            anchors.top: timeLabel.bottom
            anchors.left: time.right
            text: " / " + printTime(totalTime)//" / 03:00:00" //{ " / " + totalTime }
            color: "#003f00"
            font.pixelSize: 22
        }
        Text {
            anchors.right: percentSign.left
            anchors.bottom: percentSign.bottom
            anchors.bottomMargin: -15
            text: {
                if(totalTime === 0){
                    return 0
                } else {
                    return (elapsedDuration/totalTime * 100).toFixed(0)
                }
            }
            font.pixelSize: 70
            font.weight: Font.Thin
            color: "#00c302" // "black"//
        }
        Text {
            id: percentSign
            anchors.bottomMargin: 12
            color: "#00c302" // "black"//
            text: "%"
            font.pixelSize: 30
            x: 735; y: 70
        }
        Text {
            id: intensityLabel
            text: "Intensity"
            color: "black"
            x: 565; y: 242
            font.pixelSize: 18
        }
        Text {
            id: energy
            anchors.top: intensityLabel.bottom
            anchors.right: intensityLabel.right
            text: " ~" + equivalentEnergy(intensity) + "mJ" //" ~1.45mJ" // { equivalentEnergy() }
            color: "white"
            font.pixelSize: 22
        }
        Text {
            anchors.right: energy.left
            anchors.bottom: energy.bottom
            text: intensity + "%"
            color: "#003f00"
            font.pixelSize: 22
        }
    }

    states: [
        State { name:  "onscreen"; PropertyChanges { target: baseRect; opacity: 1.0 } },
        State { name:  "offscreen"; PropertyChanges { target: baseRect; opacity: 0.0 } }
    ]

    transitions: [
        Transition { from: "*"; to: "onscreen"; NumberAnimation { properties: "opacity"; duration: 500; easing.type: Easing.InExpo } },
        Transition { from: "*"; to: "offscreen"; NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.OutExpo } }
    ]
}
