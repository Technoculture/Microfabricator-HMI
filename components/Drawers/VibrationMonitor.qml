import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../"
import "../../"

Item {
    id: _root
    signal shutDrawer

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: Style.black
    }

    ColumnLayout {
        anchors.horizontalCenter: baseRect.horizontalCenter
        anchors.bottom: baseRect.bottom
        anchors.bottomMargin: 10

        VibrationPlot { id: vibration;
            Layout.preferredWidth: 200
            Layout.preferredHeight: 180
            lineColor: "black"; opacity: 1
            inDrawer: true
        }

        IconButton {
            buttonText: "Vibration Level is OK"
        }
    }
}

