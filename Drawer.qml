import QtQuick 2.0

Item {
    property alias state: baseRect.state

    UIStyle { id: style }

    Rectangle {
        id: baseRect
        height: 290; width: 230
        y: 95;
        color: style.bg_drawer
        state: 'closed'

        states: [
            State { name: "open";   PropertyChanges { target: baseRect; x: 522 } },
            State { name: "closed"; PropertyChanges { target: baseRect; x: 305 } }
        ]
    }

    MouseArea {
        anchors.fill: baseRect
        preventStealing: true
        onClicked: { baseRect.state == 'open' ? baseRect.state = 'closed' : baseRect.state = 'open'; }
    }
}
