import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

import "./Drawers"

Item {
    property alias state: baseRect.state

    property int currentIndex: globalCurrentIndex
    property string stateComponent: checksModel.get(currentIndex).filename
    property color stateColor: checksModel.get(globalCurrentIndex).status=== "ok" ? "darkgreen" : "darkred"
    property string stateName:  checksModel.get(currentIndex).name

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
            id: loader
            anchors.top: header.bottom
            anchors.bottom: baseRect.bottom
            anchors.left: baseRect.left
            anchors.right: baseRect.right

            source: ("./Drawers/" + stateComponent + ".qml")
        }

        states: [
            State { name: "open";   PropertyChanges { target: baseRect; x: 520-267 } },
            State { name: "closed"; PropertyChanges { target: baseRect; x: 305-267-5 } },
            State { name: "hide"; PropertyChanges { target: baseRect; x: 305-267-15 } }
        ]

        transitions: [
            Transition { from: "*"; to: "*"; NumberAnimation { target: baseRect; property: "x"; duration: 300; easing.type: Easing.InOutExpo; }}
        ]
    }
}
