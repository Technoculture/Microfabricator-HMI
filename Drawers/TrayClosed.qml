import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: style.black
    }

    UIStyle { id: style }

    ColumnLayout {
        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.verticalCenter: baseRect.verticalCenter

        DelayButton {
            id: element
            text: "Outwards"
            onClicked: {
                text = "Inwards"
            }
        }
        DelayButton {
            text: "Stop"
        }
    }
}
