import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    id: root
    property alias _state: root.state
    state: "in"

    UIStyle { id: style }

    MouseArea {
        anchors.fill: headerRect
        onClicked: { root.state === "in" ? root.state = "out" : root.state = "in" }
    }

    Rectangle {
        id: baseRect
        height: 312; width: 255
        x: 266;

		border.color: style.grey
		border.width: 1

        Drawer {
            id: drawer;
        }
    }

    Rectangle { // Header Box
        id: headerRect
		anchors { top: baseRect.top; left: baseRect.left; topMargin: 1; bottomMargin: 1; leftMargin: 1; rightMargin: 1 }
		color: style.black; height: 40; width: baseRect.width - 2
    }
    Text { // Header
        anchors { verticalCenter: headerRect.verticalCenter; left: headerRect.left; leftMargin: 20 }
        text: "Exposure checklist"
		color: style.white
    }

    Component {
        id: checkItem
        Rectangle {
            id: baseRect
			height: 40; width: parent.width - 2
            color: { status === "pending" ? style.yellow : style.green }

            Rectangle { // Selected Highlight
                anchors.fill: parent
                color: { listview.currentIndex == index ? style.black : "" }
                opacity: { listview.currentIndex == index ? 0.6 : 0 }
            }
            Text {
                id: checkItemStatus
                anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 10 }
                text: { status === "pending" ? "\u2718" : "\u2714" }
                color: { listview.currentIndex == index ? "white" : "" }
            }
            Text {
                id: checkItemName
                anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 30 }
                text: name
                color: { listview.currentIndex == index ? "white" : "" }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listview.currentIndex = index;
                    console.log(index + " : " + drawer.currentIndex) //DEBUG
                    if (drawer.state === "closed") { drawer.state = "open" }
                    else { if (drawer.currentIndex === index) { drawer.state = "closed" } }
                    drawer.currentIndex = index
                }
            }
        }
    }

    ScrollView {
		anchors { top: headerRect.bottom; bottom: baseRect.bottom; bottomMargin: 1; left: baseRect.left }

        width: baseRect.width
        clip: true

        ListView {
            id: listview
            anchors.fill: parent
			leftMargin: 1
			rightMargin: 1
            model: checksModel
            delegate: checkItem

            onCurrentIndexChanged: {
                globalCurrentIndex = currentIndex
                drawer.stateComponent = checksModel.get(currentIndex).filename
            }
        }
    }

    states: [
        State { name: "in"; PropertyChanges { target: baseRect; y: 65; } },
        State {
            name: "out"
            PropertyChanges { target: baseRect; y: 392; }
            PropertyChanges { target: drawer; visible: false }
        },
        State {
            name: "off"
            PropertyChanges { target: drawer; visible: false }
        }
    ]
}
