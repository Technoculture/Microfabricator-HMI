import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root

        color: "red"

        Text {
            id: element
            x: 280
            y: 144
            text: qsTr("Text")
            font.pixelSize: 29
        }
    }

    UIStyle { id: style }

    Slider {
        id: slider
        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.verticalCenter: baseRect.verticalCenter
        to: 100
        value: 100
        stepSize: 1
        onValueChanged: {
            uv.intensity = value
            console.log(value.toFixed(0))
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
