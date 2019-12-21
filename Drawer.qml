import QtQuick 2.0
import QtQuick.Controls 2.12

import "./Drawers"

Item {
    property int currentIndex: 0
    property alias state: baseRect.state

    property string stateComponent: "Blank"
    property color stateColor: "black"
    property string stateName: "CheckItem"

    UIStyle { id: style }

    Rectangle {
        id: baseRect
        height: 290; width: 230
        y: 95-84;
        border.color: stateColor
        border.width: 1
        state: 'closed'

        Rectangle {
            id: header
            height: 40
            width: parent.width
            color: stateColor
            opacity: 0.9

            Text {
                id: headerText
                text: stateName
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
            }
        }

        Loader {
            anchors.top: header.bottom
            anchors.bottom: baseRect.bottom
            anchors.left: baseRect.left
            anchors.right: baseRect.right

            source: ("./Drawers/" + stateComponent + ".qml")
        }

        states: [
            State { name: "open";   PropertyChanges { target: baseRect; x: 520-267 } },
            State { name: "closed"; PropertyChanges { target: baseRect; x: 305-267 } }
        ]
    }
}
