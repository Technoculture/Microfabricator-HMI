import QtQuick 2.0

Item {
    id: _root

    Rectangle {
        id: baseRect
        height: 253; width: 253
        x: 121; y: 86
        color: style.bg_checklist
        opacity: 0.9
    }

    Text {
        anchors.centerIn: baseRect
        text: "89%"
        font { pointSize: 40 }
    }

    states: [
        State { name: "off"; PropertyChanges { target: _root; visible: false } }
    ]
}
