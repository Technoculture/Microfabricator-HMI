import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"
import "../vendor"

Item {
    enabled: !exposing
    opacity: exposing ? 0.2 : 1

    FontAwesome { id: icons; resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf" }

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
        z: 300
        anchors { bottom: powerRect.top; left: powerRect.left; bottomMargin: (adviceRect.height+6) }

        property int counter: 0

        Rectangle {
            id: adviceRect
            height: 400; width: text.width + 75
            color: "black"
        }

        Column {
            id: content
            anchors.centerIn: adviceRect
            spacing: 25

            Text {
                id: icon
                text: icons.icons.fa_power_off
                font { family: icons.family; pixelSize: 60 }
                color: Style.white
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                id: text
                text: "Hold on to Shut Down"
                color: Style.white
            }
            ProgressBar {
                to: powerRectMArea.pressAndHoldInterval
                value: progressTimer.interval * adviceText.counter
                implicitWidth: text.width

                Timer {
                    id: progressTimer
                    interval: powerRectMArea.pressAndHoldInterval / 100
                    repeat: true

                    onTriggered: { adviceText.counter++ }
                }
            }
        }

        Behavior on opacity { NumberAnimation { duration: 800; easing.type: Easing.OutExpo } }
    }

    MouseArea {
        id: powerRectMArea
        anchors.fill: powerRect
        Component.onCompleted: { powerRectMArea.pressAndHoldInterval = 5000 }
        onContainsMouseChanged: {
            if(powerRectMArea.containsMouse){
                powerRect.opacity = 0.5;
                adviceText.opacity = 1;
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

        onEntered: {
            if(ufabState === "visible" || ufabState === "visibleNotSplash" || ufabState === "visibleIsBack"){
                ufabState = "visibleAtEdge"
            }
            console.log(ufabState)
        }
        onExited: {
            if(ufabState === "visibleAtEdge"){ ufabState = "visibleIsBack" }
//            else if(ufabState === "notVisible") { }
//            console.log(ufabState)
        }
    }

}
