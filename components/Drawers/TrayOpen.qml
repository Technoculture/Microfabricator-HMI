import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.14
import "../"
import "../../"
import "../../vendor"

Item {
    id: _root
    signal shutDrawer

    FontAwesome { id: icons; resource: "qrc:/vendor/fontawesome-webfont.ttf" }

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: Style.black //"lightyellow"
    }

    ColumnLayout {
        id: buttons
        anchors { horizontalCenter: baseRect.horizontalCenter; bottom: baseRect.bottom; bottomMargin: 10 }
        state: "open"
        spacing: 5

        Video {
            id: video
            height: 205; width: 200
            source: "qrc:/components/Drawers/Assets/MOVE_OUTWARDS.mp4"
            autoLoad: true; autoPlay: true
            loops: MediaPlayer.Infinite
        }

        IconButton { id: inButton; icon: "Eject"; buttonText: "Open the Tray"; action: "";
            onClicked: {
                sliderController.state = "MOVE_OUTWARDS"
                buttons.state = "stop"
                checkTargetReached.running = true
            }
        }

        Timer {
            id: checkTargetReached
            running: false; repeat: true;
            interval: 300
            onTriggered: {
                if(sliderController.hardwareState === "b\r\n"){
                    shutDrawer()
                    checkTargetReached.stop()
                }
            }
        }

        IconButton { id: stopButton; icon: "Stop"; buttonText: "Stop"; action: "";
            onClicked: { sliderController.state = "STOP_MIDWAY" }
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
