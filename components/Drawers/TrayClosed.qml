import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.14
import "../"
import "../../"
import "../../vendor"

Item {
    id: _root

    FontAwesome { id: icons; resource: "qrc:/vendor/fontawesome-webfont.ttf" }

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
        state: "close"
        spacing: 5

        Video {
            id: video
            height: 205; width: 200
            source: "qrc:/components/Drawers/Assets/MOVE_INWARDS.mp4"
            autoLoad: true
            autoPlay: true
            loops: MediaPlayer.Infinite
        }

        IconButton { id: inButton; icon: "Eject"; buttonText: "Close the Tray"; action: "";
            onClicked: {
                sliderController.state = "MOVE_INWARDS"
                buttons.state = "stop"
            }
        }

        IconButton { id: stopButton; icon: "Stop"; buttonText: "Stop"; action: "";
            onClicked: {
                sliderController.state = "STOP_MIDWAY"
                buttons.state = "close"
            }
        }

        states: [
            State { name: "close";
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
