import QtQuick 2.0

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
            text: "Shutting Down ..."
            color: "white"
            opacity: 1.0

            Timer { id: fadingTImer; interval: 1000; repeat: true; running: true
                onTriggered: { shutDownText.opacity = (shutDownText.opacity === 0.0 ? 1.0 : 0.0) }
            }

            Behavior on opacity {
                NumberAnimation { duration: 1000; easing.type: Easing.OutCirc }
            }
        }

        Behavior on opacity {
            NumberAnimation { duration: 1000; easing.type: Easing.InExpo }
        }
    }

    states: [
        State { name: "onScreen"; PropertyChanges { target: shutDownRect; opacity: 1.0 } },
        State { name: "offScreen"; PropertyChanges { target: shutDownRect; opacity: 0.0 } }
    ]
}
