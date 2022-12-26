import QtQuick 2.15
import "./assets"

Item {
    id: root
    implicitHeight: 52
    implicitWidth: label.paintedWidth + (iconImage!==""?icon.width+(2*sidePadding):sidePadding) +(label.text!==""?sidePadding:0)
    signal clicked()
    signal pressed()
    signal released()
    property alias text: label.text
    property alias radius: background.radius
    property color backgroundColor: "grey"
    property color textColor: "white"
    property string iconImage:""
    property int iconSize: 28
    property int sidePadding: 12
    Rectangle {
        id: background
        anchors.fill: parent
        color: root.enabled ? ma.pressed ? Qt.lighter(backgroundColor) : backgroundColor : Qt.darker(backgroundColor)
        Text {
            id: label
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: sidePadding
            font.pixelSize: parent.height * 0.45
            color: root.enabled ? textColor : Qt.darker(textColor)
//            text: "Button"
            visible: label.text!==""
        }
        Image {
            id: icon
            source: iconImage
            x: label.text!=="" ? parent.width-icon.width-sidePadding : sidePadding
            anchors.verticalCenter: parent.verticalCenter
            width: iconSize
            height: iconSize
            visible: icon.source!==""
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
            onPressed: root.pressed()
            onReleased: root.released()
        }
    }
}
