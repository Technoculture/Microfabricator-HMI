import QtQuick 2.0
import "../vendor"

Item {
    id: _root
    property int timeRemaining: { exposureDuration - elapsedDuration }
    property int totalTime: exposureDuration
    property int intensity: pwmIntensity

    state: "offscreen"

    FontAwesome { id: icons; resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf" }

    Rectangle {
        id: baseRect
        anchors.fill: parent

        Text {
            id: timeLabel
            text: icons.icons.fa_clock_o + " Time Remaining"
            color: "black"
            font { pixelSize: 18; family: icons.family }
            x: 170; y: 245
        }
        Text {
            id: time
            anchors { top: timeLabel.bottom; left: timeLabel.left }
            text: printTime(timeRemaining)
            color: "white"
            font.pixelSize: 22
        }
        Text {
            anchors { top: timeLabel.bottom; left: time.right }
            text: " / " + printTime(totalTime)
            color: "#003f00"
            font.pixelSize: 22
        }
        Text {
            anchors { right: percentSign.left; bottom: percentSign.bottom; bottomMargin: -15 }
            text: {
                if(totalTime === 0){ return 0 }
                else { return (elapsedDuration/totalTime * 100).toFixed(0) }
            }
            font { pixelSize: 70; weight: Font.Thin }
            color: "#00c302"
        }
        Text {
            id: percentSign
            anchors.bottomMargin: 12
            color: "#00c302"
            text: "%"
            font.pixelSize: 30
            x: 735; y: 70
        }
        Text {
            id: intensityLabel
            text: (icons.icons.fa_lightbulb_o) + " Intensity"
            color: "black"
            x: 545; y: 242
            font { pixelSize: 18; family: icons.family }
        }
        Text {
            id: energy
            anchors { top: intensityLabel.bottom; right: intensityLabel.right }
            text: " ~" + equivalentEnergy(intensity) + "mJ"
            color: "white"
            font.pixelSize: 22
        }
        Text {
            anchors { right: energy.left; bottom: energy.bottom }
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
