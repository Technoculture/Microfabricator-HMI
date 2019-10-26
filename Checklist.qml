import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    UIStyle { id: style }

    Rectangle {
        id: baseRect
        height: 312; width: 255
        x: 266; y: 84

        color: style.bg_checklist

        ListModel {
            id: checksModel
            ListElement { name: "Light Engine";             status: "ok" }
            ListElement { name: "Wafer Placed";             status: "ok" }
            ListElement { name: "Mask Placed";              status: "pending" }
            ListElement { name: "Wafer-Mask Distance";      status: "pending" }
            ListElement { name: "Tray Closed";              status: "pending" }
            ListElement { name: "XYZ Orientation";          status: "pending" }
            ListElement { name: "Light-Wafer Alignment";    status: "pending" }
            ListElement { name: "Vibration Monitor";        status: "pending" }
            ListElement { name: "Set Power";                status: "pending" }
            ListElement { name: "Set Duration";             status: "pending" }
        }

        ScrollView {
            anchors.fill: baseRect
            clip: true

            ListView {
                anchors.fill: parent
                model: checksModel
                delegate: Component { Loader { source: "CheckListItem.qml" } }
                highlight: Rectangle { color: "blue"; height: 40; width: baseRect.width }
                header: Rectangle { color: "blue"; height: 40; width: baseRect.width }
                footer: Rectangle { color: "blue"; height: 3; width: baseRect.width }
            }
        }
    }

    MouseArea {
        anchors.fill: baseRect
    }


}
