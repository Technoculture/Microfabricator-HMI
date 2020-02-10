import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"

Item {
    id: _root
    width: 790//728
    state: "offScreen"

    Rectangle {
        id: infoBoundsRect
        anchors.fill: parent
        color: "black"
    }

    ColumnLayout{
        id: info
        anchors.centerIn: infoBoundsRect
        opacity: infoBoundsRect.opacity

        Text {
            id: infoTitleText
            text:  icons.icons.fa_cog + " Summary"
            font.family: icons.family
            Layout.alignment: Qt.AlignHCenter
            color: Style.white
            Layout.bottomMargin: 60
        }

        RowLayout {
            spacing: 50
            Text {
                id: exposureInfoText
                text: "Exposure Duration: " + printTime(exposureDuration) + "min\nIntensity: " + pwmIntensity + "% (" + equivalentEnergy(pwmIntensity) + "mJ/cm2)\nFans: " + "\nNumber of Checks Pending: " + (pendingChecksCount()).toFixed(1) *10 + "\n"
                horizontalAlignment: Text.AlignLeft
                color: Style.white
            }
            Text {
                text: "Exposure Duration: " + printTime(exposureDuration) + "min\nIntensity: " + pwmIntensity + "% (" + equivalentEnergy(pwmIntensity) + "mJ/cm2)\nFans: " + "\nNumber of Checks Pending: " + (pendingChecksCount()).toFixed(1) *10 + "\n"
                horizontalAlignment: Text.AlignLeft
                color: Style.white
            }
        }
    }

    states: [
        State { name: "onScreen"; PropertyChanges { target: _root; height: 300; opacity: 0.95 } },
        State { name: "offScreen"; PropertyChanges { target: _root; height: 42; opacity: 0.0 } }
    ]

    transitions: [
        Transition { from: "offScreen"; to: "onScreen"; NumberAnimation { properties: "height,opacity"; duration: 500; easing.type: Easing.OutExpo } },
        Transition { from: "onScreen"; to: "offScreen"; NumberAnimation { properties: "height,opacity"; duration: 50; easing.type: Easing.InExpo } }
    ]
}
