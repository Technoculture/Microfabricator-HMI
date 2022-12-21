import QtQuick 2.15

Item {
    id:action
    property string time
    property string messageText
    property int messageWidth
    property int messageX
    property int messageY:0
    property string actionText
    property color actionColor
    property bool actionVisible: false
    Grid{
        columns: 2
        Text{
            id:mytime
            text: action.time+"> "
            color: "orange"
            font.pixelSize: 12
            font.bold: true
        }
        Text{
            id:mymessage
            text: action.messageText+" "
            color: "#9ca3af"
            font.pixelSize: 12
            font.bold: true
            lineHeight: 1.2
            width: card1.bodyWidth
            Rectangle{
                id:actionBut
                color: action.actionColor
                width: name.width+16
                height: name.height+3
                radius: 12
                x: mymessage.text.length+action.messageX
                y:action.messageY
                visible: action.actionVisible
                Text {
                    id: name
                    text: action.actionText+" >"
                    color: "white"
                    font.pixelSize: 12
                    anchors.centerIn: parent
                }
            }
            wrapMode: Text.WordWrap
        }
    }
}
