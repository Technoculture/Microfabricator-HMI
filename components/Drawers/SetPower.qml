import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../"
import "../../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: Style.black
    }

    ColumnLayout {
        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.bottom: baseRect.bottom
        anchors.bottomMargin: 10

        Text {
            id: percentage
            text: slider.value + "%"
            font.pixelSize: 70
            color: Style.grey
        }

        Text {
            id: energy
            font.pixelSize: 20
            text: "~ " + slider.value/100 + "mJ/cm\u00B2"
            color: Style.white
        }

        Slider {
            id: slider
            to: 100; value: { pwmIntensity }
            stepSize: 1
            onValueChanged: {
                pwmIntensity = slider.value.toFixed(0)
            }
        }

        IconButton {
            enabled: { slider.value === 0 ? false : true }
            onClicked: { pwmIntensity = slider.value.toFixed(0) }
        }
    }
}
