import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"

Item {
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
        onContainsMouseChanged: {
            if(infoRectMArea.containsMouse){ infoRect.opacity = 0.5; overlay.opacity = 0.9; }
            else { infoRect.opacity = 1; overlay.opacity = 0 }
        }
    }
}
