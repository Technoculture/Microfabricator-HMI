import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"

Item {
    id: _root
    property bool isPressed: false
    onIsPressedChanged: { handleState() }
    z: 200

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
        anchors { bottom: infoRect.top; right: infoRect.right; rightMargin: -31; bottomMargin: -42 }
        onClose: {
            _root.isPressed = !_root.isPressed
            handleState()
        }
    }

    MouseArea {
        id: infoRectMArea
        anchors.fill: infoRect
        onClicked: { overlay.close() }
    }

    function handleState(){
        if(isPressed) {
            overlay.state = "onScreen"
            if(checklistState === "in") { ufabState = "notVisible"}
            else { ufabState = "visibleAtEdge"; }
        }
        else {
            infoRect.opacity = 1.0;
            overlay.state = "offScreen"
            if(ufabState === "visibleAtEdge" || checklistState !== "in"){ ufabState = "visibleIsBack"; }
            else { ufabState = "notVisible" }
        }
    }
}
