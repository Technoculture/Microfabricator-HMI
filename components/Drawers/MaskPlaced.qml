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

    Item {
        anchors.fill: baseRect
        Column {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 18

            Text {
                text: "\u2714"
                color: style.green
                font.pointSize: 40
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    anchors.fill: parent
                    onClicked: { checksModel.set(globalCurrentIndex, {"status" : "ok"}) }
                }
            }
        }
    }
}

