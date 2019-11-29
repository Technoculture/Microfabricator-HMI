import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window; visible: true
    width: 800; height: 480// minimumWidth: 800; maximumWidth: 800; minimumHeight: 480; maximumHeight: 480;

    UIStyle { id: style }

    Rectangle {
        id: bgRect
        width: 800; height: 480
        anchors.centerIn: parent
		color: style.black
    }

//    SplashScreen {
//        id: splashscreen
//        anchors.fill: bgRect;
//        onLoadMainApp: { splashscreen.visible = false; mainapp.visible = true }
//    }

	MainApp { id: mainapp; anchors.fill: bgRect; visible: true }//false }
}
