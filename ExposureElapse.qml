import QtQuick 2.0

Item {
    property alias _text_color: style.white
    property string checklistState: "out"
    state: checklistState == "out" ? "focus" : "onside"

    UIStyle { id: style }

    Rectangle {
        id: baseRect
        height: 253; width: 253
        x: 426; y: 86
        color: style.black;
    }
    Column {
        anchors.centerIn: baseRect

        Text {
            text: "01:18:11"
            font { pointSize: 25 }
            color: _text_color
        }
        Text {
            text: "02:30:00"
            font { pointSize: 20 }
            color: _text_color
        }
        Text {
            text: "0.2W"
            font { pointSize: 20 }
            color: _text_color
        }
        Rectangle {
            id: button
            height: 40; width: 180
            color: "red"
            Text {
                text: "Stop"
                anchors.centerIn: parent
                color: _text_color
            }
        }
    }

    states: [
        State {
            name: "focus"
            PropertyChanges { target: button; visible: true }
            PropertyChanges { target: baseRect; x: 426; y: 86 }
        },
        State {
            name: "onside"
            PropertyChanges { target: button; visible: true }
            PropertyChanges { target: baseRect; x: 538; y: 86 }
        },
        State {
            name: "center";
            PropertyChanges { target: button; visible: false }
            PropertyChanges { target: baseRect; x: 274; y: 114 }
        }
    ]
}
