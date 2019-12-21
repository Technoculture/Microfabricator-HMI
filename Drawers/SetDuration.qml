import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root
    signal durationSet()

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: style.white
    }

    UIStyle { id: style }

//    GlobalState {
//        id: checksModel
//    }

    Column {
        anchors.verticalCenter: baseRect.verticalCenter
        anchors.horizontalCenter: baseRect.horizontalCenter

        Text {
            text: "Duration: " + (slider.value).toFixed(1)
        }

        Slider {
            id: slider
            value: 0.5
        }

        Text { text: "" }

        Text {
            text: "Interval: " +  (slider1.value).toFixed(1)
        }

        Slider {
            id: slider1
            value: 0.5
        }

        Button {
            id: doneButton
            text: "\u2714 " + "Done"

//            onClicked: {
//                console.log(checksModel.currentIndex)
//                console.log(checksModel.checkItemsModel.get(checksModel.currentIndex).status)
//                checksModel.checkItemsModel.set(checksModel.currentIndex, {"status" : "ok"})
//                console.log(checksModel.checkItemsModel.get(checksModel.currentIndex).status)
//            }
        }
    }
}
