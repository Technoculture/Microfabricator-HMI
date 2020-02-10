import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"

Item {
    width: 790//728
    height: 150
    opacity: 0

    Rectangle {
        id: infoBoundsRect
        anchors.fill: parent
        color: "darkred"
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
            Layout.bottomMargin: 10
        }

        RowLayout {
            spacing: 40
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

    Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutExpo } }
}
