import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window; visible: true
    minimumWidth: 800; maximumWidth: 800; minimumHeight: 480; maximumHeight: 480;

    UIStyle { id: style }

    Rectangle {
        id: bgRect
        width: 800; height: 480
        anchors.centerIn: parent
        color: style.bg

        //DEB
        MouseArea {
            anchors.fill: bgRect
            //
        }
        //END-DEB
    }

    SplashScreen {  }

    Checklist {
        id: checklist
        anchors.fill: parent
    }

    Item {
        id: exposing
        visible: false
        anchors.fill: bgRect
        Progress {  }
        ExposureElapse {  }
    }

    StatusBar {
        visible: false
        anchors { bottom: bgRect.bottom; horizontalCenter: bgRect.horizontalCenter; bottomMargin: statusHeight/2 }
    }
}
