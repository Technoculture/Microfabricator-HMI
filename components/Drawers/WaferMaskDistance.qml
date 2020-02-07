import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"
import "../../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: Style.black

        Text {
            id: element
            text: "100"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            color: Style.white
        }
    }

    Item {
        anchors.fill: baseRect
        Column {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 18

            Text {
                id: tick
                text: "\u2714"
                color: Style.green
                font.pointSize: 40
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    id: tickMouse
                    anchors.fill: parent
                    onClicked: { checksModel.set(globalCurrentIndex, {"status" : "ok"}) }
                    onHoveredChanged: {
                        if(tickMouse.containsMouse) {
                            tick.color = Qt.lighter(tick.color)
                        } else {
                            tick.color = Style.green
                        }
                    }
                }
            }
        }
    }
}

