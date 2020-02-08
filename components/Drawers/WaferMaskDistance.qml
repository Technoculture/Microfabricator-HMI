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
        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.bottom: baseRect.bottom
        anchors.bottomMargin: 10

        RowLayout {
            spacing: 10

            ProgressIndicator {
                id: distance
                Layout.preferredHeight: 160
                Layout.preferredWidth: 30
            }

            Text {
                id: perc_text
                Layout.alignment: Qt.AlignTop
                text: distance.percentage*500 +  "\u00B5m"
                font { pixelSize: 40; weight: Font.ExtraLight }
                color: Style.white
            }
        }

        IconButton { id: cal; icon: "Refresh"; buttonText: "Calliberate"; action: ""
            onClicked: {
                let invisible_comps = [distance, cal, done]
                let visible_comps = [perc_text, cal_0, cal_max, cal_cancel]
                visible_comps.map((comp)=>{comp.visible=true})
                invisible_comps.map((comp)=>{comp.visible=false})
            }
        }
        IconButton { id: done }
        IconButton { id: cal_0; icon: "Refresh"; buttonText: "Calliberate As Zero"; action: ""; visible: false }
        IconButton { id: cal_max; icon: "Refresh"; buttonText: "Calliberate As Max"; action: ""; visible: false }
        IconButton { id: cal_cancel; icon: "Back"; buttonText: "Cancel Calliberation"; action: ""; visible: false
            onClicked: { toggleCalliberate() }
        }
    }

    function toggleCalliberate(){
        let comps = [distance, perc_text, cal, done, cal_0, cal_max, cal_cancel]
        comps.map((comp)=>{comp.visible = !comp.visible})
    }
}

