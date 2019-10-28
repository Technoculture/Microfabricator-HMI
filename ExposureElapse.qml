import QtQuick 2.0

Item {
    state: "active"

    Rectangle {
        id: baseRect
        height: 253; width: 253
        x: 426; y: 86
        color: "white"; opacity: 0.1
    }
    Column {
        anchors.centerIn: baseRect

        Text {
            text: "01:18:11"
            font { pointSize: 25 }
        }
        Text {
            text: "02:30:00"
            font { pointSize: 20 }
        }
        Text {
            text: "0.2W"
            font { pointSize: 20 }
        }
        Rectangle {
            id: button
            height: 40; width: 180
            color: "red"
            Text {
                text: "Stop"
                anchors.centerIn: parent
            }
        }
    }

    states: [
        State { name: "active"; PropertyChanges { target: button; visible: true } },
        State { name: "passive"; PropertyChanges { target: button; visible: false } },
        State { name: "center";
            PropertyChanges { target: baseRect; x: 274; y: 114 }
            PropertyChanges { target: button; visible: false }
        }
    ]
}
