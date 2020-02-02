import QtQuick 2.0

Item {
    id: _root
    property string checklistState: "out"
    state: checklistState == "in" ? "out" : "in"
    //property alias Animate_x: baseRect.x

    UIStyle {
        id: style
    }

    Rectangle {
        id: baseRect
        height: 253; width: 253
        x: 121; y: 86
        color: style.black
    }

    Text {
        anchors.centerIn: baseRect
        text: "89%"
        font { pointSize: 40 }
        color: style.white
    }

    states: [
        State {
            name: "in"
            PropertyChanges { target: baseRect; color: style.red }
            PropertyChanges { target: baseRect; x:  121}
        },
        State {
            name: "out"
            PropertyChanges { target: baseRect; color: style.green }
            PropertyChanges { target: baseRect; x: 10 }
        },
        State {
            name: "off"
            PropertyChanges { target: baseRect; visible: false }
        }
    ]
}
