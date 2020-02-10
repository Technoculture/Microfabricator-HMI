import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"

Item {
    id: _root
    property bool isPressed: false

    onIsPressedChanged: { handleState() }

    Timer {
        id: infoTimeOut
        interval: 4000
        onTriggered: {
//            console.log(_root.isPressed + " -> " + infoTimeOut.running)
            if(infoTimeOut.running){ }
            else {
                infoTimeOut.stop()
                _root.isPressed = false
                handleState()
            }
        }
    }

    Rectangle {
        id: infoRect
        anchors.fill: parent
        color: Qt.rgba(0,0,0,0.5)
        Text {
            anchors.centerIn: parent
            font.family: icons.family
            text: icons.icons.fa_info
            color: Style.white
        }
    }

    InfoOverlayWide {
        id: overlay
        anchors { bottom: infoRect.top; right: infoRect.right; rightMargin: -31; bottomMargin: 5 }
    }

    MouseArea {
        id: infoRectMArea
        anchors.fill: infoRect
        onClicked: {  _root.isPressed = !_root.isPressed }
    }

    function handleState(){
//        console.log(ufabState)
//        console.log(checklistState)
        if(isPressed) {
            infoTimeOut.running = true
            overlay.state = "onScreen"
            if(checklistState === "in"){ ufabState = "notVisible"}
            else { ufabState = "visibleAtEdge"; }
        }
        else {
            infoTimeOut.stop()
            infoRect.opacity = 1.0;
            overlay.state = "offScreen"
            if(ufabState === "visibleAtEdge" || checklistState !== "in"){
                ufabState = "visibleIsBack";
            } else {
                ufabState = "notVisible"
            }
        }
//        console.log("--> " + ufabState)
    }
}
