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
        anchors.bottomMargin: 20

        Image {
            id: illustration
            Layout.preferredWidth: 200
            Layout.preferredHeight: 180
            fillMode: Image.PreserveAspectCrop
            source: "Assets/microfabricator.png"
        }

        RoundButton {
            id: doneButton
            text: "\u2714 " + "Mask is Placed"
            Layout.preferredWidth: 200
            Layout.preferredHeight: 30

            onClicked: { checksModel.set(globalCurrentIndex, {"status" : "ok"}) }
        }
    }
}

