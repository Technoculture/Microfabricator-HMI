import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../"
import "../../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: Style.black
    }

    ColumnLayout {
        id: buttons
        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.bottom: baseRect.bottom
        anchors.bottomMargin: 10
        state: "open"

        Image {
            id: illustration
            height: 180
            width: 200
            source: "Assets/microfabricator.png"
        }

        RoundButton {
            id: inButton
            text: "Open the Tray"
            Layout.preferredWidth: 200
            Layout.preferredHeight: 30
            onClicked: {
                sliderController.state = "MOVE_OUTWARDS"
                buttons.state = "stop"
            }

        }
        RoundButton {
            id: stopButton
            text: "Stop"
            Layout.preferredWidth: 200
            Layout.preferredHeight: 30
            visible: false
            onClicked: {
                sliderController.state = "STOP_MIDWAY"
                buttons.state = "open"
            }
        }

        states: [
            State { name: "open";
                PropertyChanges { target: inButton; visible: true }
                PropertyChanges { target: stopButton; visible: false }
            },
            State { name: "stop";
                PropertyChanges { target: inButton; visible: false }
                PropertyChanges { target: stopButton; visible: true }
            }
        ]
    }
}
