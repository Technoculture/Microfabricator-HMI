import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root

        color: "green"

        Switch {
            id: element
            x: 261
            y: 220
            text: qsTr("Switch")
        }
    }

    UIStyle { id: style }
}
