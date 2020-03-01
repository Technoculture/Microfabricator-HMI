import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.14
import "../"
import "../../"

Item {
    id: _root
    signal shutDrawer

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: Style.black
    }

    ColumnLayout {
        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.bottom: baseRect.bottom
        anchors.bottomMargin: 10

        Text {
            text: parseInt(distsenseController.serialData)
            font { pixelSize: 40; weight: Font.ExtraLight }
            color: Style.white
        }

        Video {
            id: video
            height: 100; width: 175
            source: "qrc:/components/Drawers/Assets/MaskWaferAlignment.mp4"
            autoLoad: true; autoPlay: true
            loops: MediaPlayer.Infinite
            fillMode: VideoOutput.PreserveAspectCrop
        }

        IconButton { id: cal_max; icon: "Refresh"; buttonText: "Calliberate As 100\u00B5m"; action: ""; visible: false }

        IconButton { buttonText: "Calliberation Done" }
    }
}
