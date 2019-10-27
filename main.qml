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

    Drawer {
        id: drawer
        anchors.fill: bgRect
    }

    Checklist {
        anchors.fill: bgRect
        onToggleDrawer: {
            console.log(checkIndex + " : " + drawer.currentIndex)
            if (drawer.state === "closed") { drawer.state = "open" }
            else { if (drawer.currentIndex === checkIndex) { drawer.state = "closed" } }
            drawer.currentIndex = checkIndex
        }
    }

    Progress {  }

    ExposureElapse {  }

    StatusBar {
        anchors { bottom: bgRect.bottom; horizontalCenter: bgRect.horizontalCenter; bottomMargin: statusHeight/2 }
    }
}
