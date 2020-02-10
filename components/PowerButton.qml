import QtQuick 2.0
import "../"

Item {
    Rectangle {
        id: powerRect
        anchors.fill: parent
        color: Qt.rgba(0,0,0,0.5)
        Text {
            anchors.centerIn: parent
            font.family: icons.family
            text: icons.icons.fa_power_off
            color: Style.white
        }
    }
    Text {
        id: adviceText
        anchors { bottom: powerRect.top; left: powerRect.left; bottomMargin: 5 }
        text: "Hold on to Shut Down"
        color: Style.white
        opacity: 0

        Behavior on opacity {
             NumberAnimation { duration: 500; easing.type: Easing.OutExpo }
        }
    }
    MouseArea {
        id: powerRectMArea
        anchors.fill: powerRect
        onContainsMouseChanged: {
            if(powerRectMArea.containsMouse){ powerRect.opacity = 0.5; adviceText.opacity = 0.7; }
            else { powerRect.opacity = 1; adviceText.opacity = 0 }
        }
        onPressAndHold: { shutDown() }
    }

}
