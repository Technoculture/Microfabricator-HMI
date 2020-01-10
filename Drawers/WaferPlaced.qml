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

    Column {
        anchors.fill: baseRect
        anchors.margins: 20
        spacing: 20

        CheckBox {
            onCheckedChanged: {
                uvController.pumpState = checked
            }
        }

        Button {
            id: doneButton
            text: "\u2714 " + "Done"

            onClicked: { checksModel.set(globalCurrentIndex, {"status" : "ok"}) }
        }
    }
}
