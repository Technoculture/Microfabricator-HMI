import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: style.black
    }

    UIStyle { id: style }

    Column {
        anchors.fill: baseRect
        anchors.margins: 20
        spacing: 18

        Text {
            id: element
            text: slider.value
            font.pixelSize: 29
            color: style.white
        }

        Slider {
            id: slider
            to: 100; value: 100; stepSize: 1
            onValueChanged:{uvController.intensity = value.toFixed(0)}
        }

        Button {
            id: doneButton
            text: "\u2714 " + "Done"

            onClicked: {
//                console.log(globalCurrentIndex)
//                console.log(checksModel.get(globalCurrentIndex).status)
                checksModel.set(globalCurrentIndex, {"status" : "ok"})
//                console.log(checksModel.get(globalCurrentIndex).status)
            }
        }
    }
}
