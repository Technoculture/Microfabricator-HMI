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

    Item {
        id: checking
        anchors.fill: bgRect
        state: "in"

        Drawer {
            id: drawer
            anchors.fill: parent
        }
        Checklist {
            id: checklist
            anchors.fill: parent
            onToggleDrawer: {
                console.log(checkIndex + " : " + drawer.currentIndex)
                if (drawer.state === "closed") { drawer.state = "open" }
                else { if (drawer.currentIndex === checkIndex) { drawer.state = "closed" } }
                drawer.currentIndex = checkIndex
            }
        }
        MouseArea {
            anchors.fill: drawer
            onClicked: {
                checklist.state === "in" ? checklist.state = "out" : checklist.state = "in"; console.log( checklist.state)
            }
        }
    }

    Item {
        id: exposing
        visible: false
        anchors.fill: bgRect
        Progress {  }
        ExposureElapse {  }
    }

    StatusBar {
        anchors { bottom: bgRect.bottom; horizontalCenter: bgRect.horizontalCenter; bottomMargin: statusHeight/2 }
    }
}
