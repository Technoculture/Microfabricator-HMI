import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root
    signal durationSet()

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: "black"
    }

    UIStyle { id: style }

    Column {
        anchors.verticalCenter: baseRect.verticalCenter
        anchors.horizontalCenter: baseRect.horizontalCenter

        Text {
            text: "Duration: " + (slider.value).toFixed(1)
            color: style.white
        }

        Slider {
            id: slider
            value: 0.5
        }

        Text {
            text: "Interval: " +  (slider1.value).toFixed(1)
            color: style.white
        }

        Slider {
            id: slider1
            value: 0.5
        }

        Button {
            id: doneButton
            text: "\u2714 " + "Done"

            onClicked: {
                console.log(globalCurrentIndex)
                console.log(checksModel.get(globalCurrentIndex).status)
                checksModel.set(globalCurrentIndex, {"status" : "ok"})
                console.log(checksModel.get(globalCurrentIndex).status)
            }
        }
    }
}
