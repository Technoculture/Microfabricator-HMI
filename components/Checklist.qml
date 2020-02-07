import QtQuick 2.0
import QtQuick.Controls 2.12
import "."

Item {
    id: root
    property alias _state: root.state
    state: "out"

    UIStyle { id: style }

    MouseArea {
        anchors.fill: headerRect
        onContainsMouseChanged: {
            if(containsMouse){
                headerRect.color = "darkgreen"
            } else {
                headerRect.color = "black"
            }
        }
        onClicked: {
            if(root.state === "in") { root.state = "out"; }
            else { root.state = "in"; drawer.state = "closed"; }
        }
    }

    Rectangle {
        id: baseRect
        height: 312; width: 255
        x: 266;
        color: style.black

        border.color: style.black
		border.width: 1

        Drawer {
            id: drawer;
            opacity: { root.opacity < 0.2 ? 0 : 1 }
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
            color: {
                if(status === "utility"){
                    style.yellow
                } else if(status === "pending"){
                    style.red
                } else {
                    style.green
                }
            }

            Rectangle { // Selected Highlight
                id: highlight
                anchors.fill: parent
                gradient: Gradient { GradientStop { position: 0.0; color: "darkblue" } GradientStop { position: 0.5; color: "black" } GradientStop { position: 1.0; color: "darkblue" } }
                opacity: { listview.currentIndex == index ? 0.4 : 0 }
            }
            Text {
                id: checkItemStatus
                anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 10 }
                text: {
                    if(index === listview.currentIndex){ "\u2794" }
                    else if( status === "pending"){ "\u2718"}
                    else { "\u2714" }
                }
                color: { listview.currentIndex == index ? "white" : "" }
            }
            Text {
                id: checkItemName
                anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 30 }
                text: name
                color: { listview.currentIndex === index ? "white" : "" }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listview.currentIndex = index;
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
        ScrollBar.vertical.interactive: true

        ListView {
            id: listview
            anchors.fill: parent
            leftMargin: 1
            rightMargin: 1
            model: checksModel
            delegate: checkItem
            highlight: highlight
            highlightFollowsCurrentItem: false
            focus: true

            onCurrentIndexChanged: {
                globalCurrentIndex = currentIndex
                drawer.stateComponent = checksModel.get(currentIndex).filename
            }
        }
    }

    states: [
        State {
            name: "in";
            PropertyChanges { target: baseRect; y: 65; }
            PropertyChanges { target: drawer; x: 10; }
        },
        State {
            name: "out"
            PropertyChanges { target: baseRect; y: 392; }
            PropertyChanges { target: drawer; x: 0; }
            PropertyChanges { target: drawer; state: "hide"; }
        },
        State {
            name: "notVisible"
            PropertyChanges { target: baseRect; y: 500; }
            PropertyChanges { target: drawer; x: 0; }
            PropertyChanges { target: drawer; state: "hide"; }
        }
    ]

    transitions: [
        Transition { from: "in"; to: "*";
            SequentialAnimation {
                PropertyAnimation { target: drawer; properties: "x"; duration: 200; easing.type: Easing.InOutExpo }
                NumberAnimation { target: baseRect; property: "y"; duration: 500; easing.type: Easing.InOutExpo }
            }
        },
        Transition { from: "out,off"; to: "in";
            NumberAnimation { target: baseRect; property: "y"; duration: 200; easing.type: Easing.InOutExpo }
        },
        Transition { from: "notVisible"; to: "out";
            SequentialAnimation {
                NumberAnimation { target: baseRect; property: "y"; duration: 300; easing.type: Easing.InOutExpo }
                PropertyAnimation { target: drawer; properties: "x"; duration: 500; easing.type: Easing.InOutExpo }
            }
        }
    ]
}
