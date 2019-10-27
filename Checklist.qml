import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    UIStyle { id: style }

    Rectangle {
        id: baseRect
        height: 312; width: 255
        x: 266; y: 84
        color: style.bg_checklist
    }

    Component {
        id: checkItem
        Rectangle {
            id: baseRect
            height: 40; width: parent.width
            color: { status === "pending" ? "red" : style.lightgreen }

            Rectangle { // Selected Highlight
                anchors.fill: parent
                color: { listview.currentIndex == index ? "black" : "" }
                opacity: { listview.currentIndex == index ? 0.2 : 0 }
            }

            Text {
                id: checkItemStatus
                anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 10 }
                text: { status === "pending" ? '+' : '-' }
            }
            Text {
                id: checkItemName
                anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 30 }
                text: name
            }
            MouseArea {
                anchors.fill: parent    //onClicked: { console.log("List Item Clicked: " + name + " : " + status) }
                onClicked: { listview.currentIndex = index }
            }
        }
    }

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
            id: listview
            anchors.fill: parent
            model: checksModel
            delegate: checkItem
            header: Rectangle {
                color: "grey"; height: 40; width: baseRect.width
                Text {
                    anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 20 }
                    text: "Header"
                }
            }
        }
    }
}
