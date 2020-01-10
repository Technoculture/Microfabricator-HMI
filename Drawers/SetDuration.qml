import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root
    signal durationSet()

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
            text: durationSlider.value
            font.pixelSize: 29
            color: style.white
        }

        Slider {
            id: durationSlider
            to: 1200; value: 0; stepSize: 5
            onValueChanged:{}
        }

        Button {
            id: doneButton
            text: "\u2714 " + "Done"

            onClicked: {
                checksModel.set(globalCurrentIndex, {"status" : "ok"})
            }
        }
    }
}
