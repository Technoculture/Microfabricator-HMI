import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"

Item {
    id: _root
    state: "offScreen"
    signal close

    width: 790

    Rectangle {
        id: infoBoundsRect
        anchors.fill: parent
        color: "black"
    }

    MouseArea {
        id: mousearea
        anchors.right: _root.right
        anchors.bottom: _root.bottom
        height: _root.height
        width: 0
        onClicked: { _root.close() }
    }

    Rectangle {
        id: infoTitleRect
        height: infoTitleText.height + 40
        width: _root.width
        color: "black"
    }

    Text {
        id: infoTitleText
        text:  icons.icons.fa_cog + " Summary"
        font.family: icons.family
        anchors.centerIn: infoTitleRect
        color: Style.white
    }

    RowLayout {
        id: info
        anchors.centerIn: infoBoundsRect
        opacity: infoBoundsRect.opacity
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

    states: [
        State { name: "onScreen"; PropertyChanges { target: _root; height: 300; opacity: 0.95; } PropertyChanges { target: mousearea; width: 790 } },
        State { name: "offScreen"; PropertyChanges { target: _root; height: 42; opacity: 0; } PropertyChanges { target: mousearea; width: 42 } }
    ]

    transitions: [
        Transition { from: "offScreen"; to: "onScreen"; NumberAnimation { properties: "height,opacity"; duration: 300; easing.type: Easing.OutExpo } },
        Transition { from: "onScreen"; to: "offScreen"; NumberAnimation { properties: "height,opacity"; duration: 50; easing.type: Easing.InExpo } }
    ]
}
