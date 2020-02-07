import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../vendor"

Item {
    id: _root

    property string buttonText: "Done"
    signal clicked

    Layout.preferredHeight: 30
    Layout.preferredWidth: 200

    FontAwesome { id: icons; resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf" }

    RoundButton {
        id: doneButton
        text: icons.icons.fa_check_circle + " " + buttonText
        font.family: icons.family
        width: 200; height: 30

        onClicked: {
            checksModel.set(globalCurrentIndex, {"status" : "ok"})
            _root.clicked()
        }
    }

}
