import QtQuick 2.0
//import QtQuick3D 1.0

Item {
    id: _root
    property alias shutstate: _root.state

    anchors.fill: parent
    state: "offScreen"

    Rectangle {
        id: shutDownRect
        anchors.fill: parent
        color: "black"
        opacity: 0

        Text {
            id: shutDownText
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 100
            text: "Shutting Down"
            color: "white"
        }

        Text {
            id: shutDownDots
            anchors.verticalCenter: shutDownText.verticalCenter
            anchors.left: shutDownText.right
            text: " ..."
            color: "white"
            opacity: 1.0

            Timer { id: fadingTImer; interval: 1000; repeat: true; running: false
                property int ticks: 0
                onRunningChanged: {
                    if(fadingTImer.running){ cleanupHardwareResources() }
                }

                onTriggered: {
                    ticks += 1
                    shutDownDots.opacity = (shutDownDots.opacity === 0.0 ? 1.0 : 0.0)
                    if(fadingTImer.ticks >= 11){
                        shutDownText.visible = false
                        shutDownDots.visible = false
                        fadingTImer.stop()
                    }
                }
            }
            Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.Linear } }
        }
        Behavior on opacity { NumberAnimation { duration: 1000; easing.type: Easing.InExpo } }
    }

    states: [
        State { name: "onScreen"; PropertyChanges { target: shutDownRect; opacity: 1.0 } PropertyChanges { target: fadingTImer; running: true }  },
        State { name: "offScreen"; PropertyChanges { target: shutDownRect; opacity: 0.0 } }
    ]
}
