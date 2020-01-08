import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    id: _root

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: style.black
    }

    UIStyle { id: style }

    Button {
        id: doneButton
        text: "\u2714 " + "Done"

        onClicked: {
            console.log(globalCurrentIndex)
            console.log(checksModel.get(globalCurrentIndex).status)
            checksModel.set(globalCurrentIndex, {"status" : "ok"})
            console.log(checksModel.get(globalCurrentIndex).status)
        }
    }
}
