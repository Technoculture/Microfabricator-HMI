import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    signal toggleDrawer(int checkIndex)
    state: "in"
//    property alias state:

    UIStyle { id: style }

    Rectangle {
        id: baseRect
        height: 312; width: 255
        x: 266;
        color: style.bg_checklist
        opacity: 0.9
    }

    Rectangle { // Header Box
        id: headerRect
        anchors { top: baseRect.top; left: baseRect.left }
        opacity: 0.3
        color: "grey"; height: 40; width: baseRect.width
    }
    Text { // Header
        anchors { verticalCenter: headerRect.verticalCenter; left: headerRect.left; leftMargin: 20 }
        text: "Header"
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
                onClicked: { listview.currentIndex = index; toggleDrawer(index) } // console.log(index);
            }
        }
    }
    ListModel {
        id: checksModel
        ListElement { name: "Light Engine";             status: "ok" }
        ListElement { name: "Wafer Placed";             status: "ok" }
        ListElement { name: "Mask Placed";              status: "ok" }
        ListElement { name: "Wafer-Mask Distance";      status: "ok" }
        ListElement { name: "Tray Closed";              status: "ok" }
        ListElement { name: "XYZ Orientation";          status: "ok" }
        ListElement { name: "Light-Wafer Alignment";    status: "ok" }
        ListElement { name: "Vibration Monitor";        status: "ok" }
        ListElement { name: "Set Power";                status: "ok" }
        ListElement { name: "Set Duration";             status: "ok" }
    }

    ScrollView {
        anchors { top: headerRect.bottom; bottom: baseRect.bottom; left: baseRect.left }
        width: baseRect.width
        clip: true
        ListView {
            id: listview
            anchors.fill: parent
            model: checksModel
            delegate: checkItem
        }
    }

    states: [
        State { name: "in"; PropertyChanges { target: baseRect; y: 84 } },
        State { name: "out"; PropertyChanges { target: baseRect; y: 392 } }
    ]
}
