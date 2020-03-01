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

        RowLayout {
            spacing: 5

            ProgressIndicator {
                id: distance
                Layout.preferredHeight: 200
                Layout.preferredWidth: 30
                percentage: parseFloat((parseInt(distsenseController.serialData)/1000).toFixed(2))
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignTop

                Video {
                    id: video
                    height: 100; width: 175
                    source: "qrc:/components/Drawers/Assets/MaskWaferAlignment.mp4"
                    autoLoad: true; autoPlay: true
                    loops: MediaPlayer.Infinite
                    fillMode: VideoOutput.PreserveAspectCrop
                }

                Text {
                    id: perc_text
                    text: parseInt(distsenseController.serialData) +  "\u00B5m"
                    font { pixelSize: 40; weight: Font.ExtraLight }
                    color: Style.white
                }
            }
        }
        IconButton { id: done; }
    }
}

