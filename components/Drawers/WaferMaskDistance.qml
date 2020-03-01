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
            spacing: 10

            ProgressIndicator {
                id: distance
                Layout.preferredHeight: 160
                Layout.preferredWidth: 30
//                value: parseInt(distsenseController.serialData)
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

        IconButton { id: cal; icon: "Refresh"; buttonText: "Calliberate"; action: ""
            onClicked: {
                let invisible_comps = [distance, cal, done, video]
                let visible_comps = [perc_text, cal_0, cal_max, cal_cancel]
                visible_comps.map((comp)=>{comp.visible=true})
                invisible_comps.map((comp)=>{comp.visible=false})
            }
        }
        IconButton { id: done; /*onClicked: shutDrawer()*/ }
        IconButton { id: cal_0; icon: "Refresh"; buttonText: "Calliberate As 0\u00B5m"; action: ""; visible: false }
        IconButton { id: cal_max; icon: "Refresh"; buttonText: "Calliberate As 100\u00B5m"; action: ""; visible: false }
        IconButton { id: cal_cancel; icon: "Back"; buttonText: "Calliberation Complete"; action: ""; visible: false
            onClicked: { toggleCalliberate() }
        }
    }

    function toggleCalliberate(){
        let comps = [distance, perc_text, cal, done, cal_0, cal_max, cal_cancel, perc_text, video]
        comps.map((comp)=>{comp.visible = !comp.visible})
    }
}

