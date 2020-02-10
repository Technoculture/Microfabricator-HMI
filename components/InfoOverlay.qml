import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"

Item {
    height: info.height + 30
    width: info.width + 30
    opacity: 0
    z: 101

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
            Layout.bottomMargin: 10
        }

        Text {
            id: infoText
            text: "Exposure Duration: " + printTime(exposureDuration) + "min\nIntensity: " + pwmIntensity + "% (" + equivalentEnergy(pwmIntensity) + "mJ/cm2)\nFans: " + "\nNumber of Checks Pending: " + (pendingChecksCount()).toFixed(1) *10 + "\n"
            horizontalAlignment: Text.AlignLeft
            color: Style.white
        }
    }

    Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutExpo } }
}
