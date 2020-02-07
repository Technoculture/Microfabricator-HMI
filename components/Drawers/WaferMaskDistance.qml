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

        Text {
            id: element
            text: progress.value*200 +  "\u00B5m"
            font { pixelSize: 45; weight: Font.ExtraLight }
            color: Style.white
        }

        ProgressBar {
            id: progress
            value: 0.05
        }

        DoneButton {}
    }
}

