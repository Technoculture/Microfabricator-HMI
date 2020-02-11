import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../"
import "../../"

Item {
    id: _root
    property int durationSeconds: { (minSlider.value*60) + secSlider.value }

    onDurationSecondsChanged: {
        console.log(durationSeconds)
    }

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
            text: { printTime(_root.durationSeconds) }
            font.pixelSize: 60
            font.weight: Font.ExtraLight
            color: Style.white
        }

        Slider {
            id: minSlider
            to: 9; value: { (exposureDuration / 60).toFixed(0) }
            stepSize: 1
        }

        Slider {
            id: secSlider
            to: 55; value: {exposureDuration % 60}
            stepSize: 5
        }

        IconButton {
            enabled: { durationSeconds < 1 ? false : true }
            onClicked: { exposureDuration = _root.durationSeconds }
        }
    }
}
