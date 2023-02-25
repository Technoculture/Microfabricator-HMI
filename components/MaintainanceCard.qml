import QtQuick 2.15

Item{
    id: root
    implicitWidth: 730
    implicitHeight: 360

    property alias titleText: title.text
    property alias descriptionText: description.text
    property string successText: "Ejected"
    property bool successVisible: true
    property bool cancelVisible: true
    property string iconMode: "Eject"
    Rectangle{
        anchors.fill: parent
        radius: 20
        color: "black"
        border{
            width: 1
            color: "white"
        }

        Grid{
            anchors.centerIn: parent
            columns: 2
            columnSpacing: 60
            rowSpacing: 10
            Rectangle{
                width: 290
                height: 280
                color: "transparent"
                Image {
                    id: icons
                    source: "../assets/Icon/"+iconMode+".png"
                }
                Text {
                    id: mainTitle
                    text: "Maintenance Mode"
                    font.pixelSize: 28
                    color: "white"
                    topPadding: 10
                    font.bold: true
                    anchors.top: icons.bottom
                }
                Text {
                    id: title
                    font.pixelSize: 16
                    color: "white"
                    topPadding: 10
                    anchors.top: mainTitle.bottom
                    width: parent.width
                    wrapMode: Text.WordWrap
                }
            }
            Rectangle{
                width: 270
                height: 280
                color: "transparent"
                Text {
                    id: description
                    font.pixelSize: 16
                    color: "#B9B9B9"
                    bottomPadding: 40
                    anchors.bottom: buttons.top
                    wrapMode: Text.WordWrap
                    width: parent.width
                }
                Grid{
                    id: buttons
                    anchors.bottom: parent.bottom
                    columns: 2
                    spacing: 20
                    Button{
                        id: cancelButton
                        text: "Cancel"
                        radius: 10
                        backgroundColor: "#FFA487"
                        textColor: "black"
                        width: successVisible==false?270:125
                        sidePadding: successVisible == false ? 105 : 37
                        height: 60
                        labelFontSize: 18
                        onClicked: maintainanceMode.visible=false
                        visible: cancelVisible
                    }
                    Button{
                        id: successButton
                        text: successText
                        radius: 10
                        backgroundColor: "#98FF87"
                        textColor: "black"
                        width: cancelVisible==false?270:125
                        sidePadding: cancelVisible == false ? 100 : 34
                        height: 60
                        labelFontSize: 18
                        onClicked: maintainanceMode.visible=false
                        visible: successVisible
                    }
                }
            }
        }
    }
}
