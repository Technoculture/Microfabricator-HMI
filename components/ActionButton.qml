import QtQuick 2.15
import "../assets"

Item {
    id: root
    implicitHeight: 60
    implicitWidth: 125
    signal clicked()
    property alias text: label.text
    property color backgroundColor: "grey"
    Rectangle {
        id: background
        anchors.fill: parent
        color: root.enabled ? ma.pressed ? Qt.lighter(backgroundColor) : backgroundColor : Qt.darker(backgroundColor)
        radius: 10
        Text {
            id: label
            anchors.centerIn: parent
            font.pixelSize: 18
            color: root.enabled ? "black" : Qt.darker("black")
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
