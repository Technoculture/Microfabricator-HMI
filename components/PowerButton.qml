import QtQuick 2.0
import QtQuick.Controls 2.12
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

    Item {
        id: adviceText
        opacity: 0
        anchors { bottom: powerRect.top; left: powerRect.left; bottomMargin: 50 }

        property int counter: 0

        Column {
            id: content
            anchors.fill: parent
            spacing: 10

            Text {
                text: "Hold on to Shut Down"
                color: Style.white
            }
            ProgressBar {
                to: powerRectMArea.pressAndHoldInterval
                value: progressTimer.interval * adviceText.counter

                Timer {
                    id: progressTimer
                    interval: powerRectMArea.pressAndHoldInterval / 100
                    repeat: true

                    onTriggered: { adviceText.counter++ }
                }
            }
        }

        Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutExpo } }
    }

    MouseArea {
        id: powerRectMArea
        anchors.fill: powerRect
        Component.onCompleted: { powerRectMArea.pressAndHoldInterval = 2000 }
        onContainsMouseChanged: {
            if(powerRectMArea.containsMouse){
                powerRect.opacity = 0.5;
                adviceText.opacity = 0.7;
                progressTimer.running = true;
            }
            else {
                powerRect.opacity = 1;
                adviceText.opacity = 0;
                progressTimer.stop()
                adviceText.counter = 0;
            }
        }
        onPressAndHold: { shutDown() }
    }

}
