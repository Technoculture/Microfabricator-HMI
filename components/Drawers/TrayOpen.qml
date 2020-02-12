import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
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
        state: "open"

        Image {
            id: illustration
            height: 180; width: 200
            source: "Assets/microfabricator.png"
        }

        IconButton { id: inButton; icon: "Eject"; buttonText: "Open the Tray"; action: "";
            onClicked: {
                sliderController.state = "MOVE_OUTWARDS"
                buttons.state = "stop"
            }
        }

        IconButton { id: stopButton; icon: "Stop"; buttonText: "Stop"; action: "";
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
