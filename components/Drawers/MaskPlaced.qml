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

        Video {
            id: video
            height: 205; width: 200
            source: "qrc:/components/Drawers/Assets/MaskPlaced.mp4"
            autoLoad: true
            autoPlay: true
            loops: MediaPlayer.Infinite
        }

        IconButton { buttonText: "Mask is Placed" }
    }
}

