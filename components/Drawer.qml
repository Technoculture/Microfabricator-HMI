import QtQuick 2.0
import QtQuick.Controls 2.12

import "../"
import "./Drawers"
import "../vendor"

Item {
    id: _root
    property alias state: baseRect.state

    property int currentIndex: globalCurrentIndex
    property string stateComponent: checksModel.get(currentIndex).filename
    property color stateColor: { checksModel.get(globalCurrentIndex).status === "ok" ? "darkgreen" : (checksModel.get(globalCurrentIndex).status === "pending" ? "darkred" : Style.yellow) }
    property string stateName:  checksModel.get(currentIndex).name

    FontAwesome { id: icons; resource: "qrc:/vendor/fontawesome-webfont.ttf" }

    Rectangle {
        id: baseRectOverlay
        anchors.fill: baseRect
        color: stateColor
        z: 100
    }

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
                text: icons.icons.fa_edit + " " + stateName
                font.family: icons.family
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: {
                    if(stateColor === Style.yellow){ "black" }
                    else { "white" }
                }
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
            State { name: "open";   PropertyChanges { target: baseRect; x: 520-267 } PropertyChanges { target: baseRectOverlay; opacity: 0 } },
            State { name: "closed"; PropertyChanges { target: baseRect; x: 305-267-5 } PropertyChanges { target: baseRectOverlay; opacity: 0.5 } },
            State { name: "hide"; PropertyChanges { target: baseRect; x: 305-267-15 } PropertyChanges { target: baseRectOverlay; opacity: 1 } }
        ]

        transitions: [
            Transition { from: "*"; to: "*"; NumberAnimation { target: baseRect; property: "x"; duration: 300; easing.type: Easing.InOutExpo; } NumberAnimation { target: baseRectOverlay; property: "opacity"; duration: 200; easing.type: Easing.InExpo; } }
        ]
    }
}
