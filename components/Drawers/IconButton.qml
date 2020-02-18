import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.12
import "../../vendor"

Item {
    id: _root

    property string buttonText: "Done"
    property string icon: "Done"
    property string action: "Done" // Preconfigured Actions
    property bool canToggle: false
    property alias checked: rb.checked
    signal clicked // Overwrittable signal to be fired at click

    Layout.preferredHeight: 30
    Layout.preferredWidth: 200

    FontAwesome { id: icons; resource: "qrc:/vendor/fontawesome-webfont.ttf" }

    RoundButton {
        id: rb
        contentItem: Text {
            text: getIcon() + "  " + buttonText
            font { family: icons.family; pixelSize: 14 }
            anchors.left: parent.left
            anchors.leftMargin: 15
        }
        width: 200; height: 30
        checkable: _root.canToggle
        onClicked: {
            _root.doAction()
            _root.clicked()
        }
    }

    function getIcon(){
        let ico = _root.icon
        if(ico === "Done") { return icons.icons.fa_check_circle }
        else if(ico === "Refresh") { return icons.icons.fa_refresh }
        else if(ico === "Back") { return icons.icons.fa_arrow_left }
        else if(ico === "Down") { return icons.icons.fa_download }
        else if(ico === "Eject") { return icons.icons.fa_eject }
        else if(ico === "Stop") { return icons.icons.fa_stop }
        else if(ico === "") { return "" }
    }

    function doAction(){
        let act = _root.action
        if(act === "Done") { shutDrawer(); checksModel.set(globalCurrentIndex, {"status" : "ok"}) }
        else if(act === "") {}
    }

}
