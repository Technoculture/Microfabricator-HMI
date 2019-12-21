import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root

        color: "red"

        Switch {
            id: element
            x: 261
            y: 220
            text: qsTr("Switch")
        }
    }

    UIStyle { id: style }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
