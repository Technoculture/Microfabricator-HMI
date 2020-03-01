import QtQuick 2.0

Item {
    property double percentage: 0.01

    Rectangle {
        id: progressBase
        anchors.fill: parent
        width: 30; height: parent.height
        color: Qt.rgba(1,1,1,0.1)
    }

    Rectangle {
        id: progressBar
        color: Qt.rgba(1,1,1,0.3)
        width: parent.width; height: progressBase.height * percentage
        anchors.bottom: progressBase.bottom
    }
}
