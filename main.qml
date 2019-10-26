import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window; visible: true
    // DEB
    width: 800; height: 480
    // EDEB //    minimumWidth: 800; maximumWidth: 800; minimumHeight: 480; maximumHeight: 480;

    UIStyle { id: style }

    Rectangle {
        id: bgRect
        width: 800; height: 480
        anchors.centerIn: parent
        color: style.bg
    }

    Drawer {
        anchors.fill: bgRect
        opacity: 0.2
    }

    Checklist {
        anchors.fill: bgRect
        opacity: 0.9
    }

    StatusBar {
        anchors { bottom: bgRect.bottom; horizontalCenter: bgRect.horizontalCenter; bottomMargin: statusHeight/2 }
    }
}
