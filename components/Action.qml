import QtQuick 2.15

Item {
    id:action
    property string time
    property string message
    property int messageWidth
    property int messageX
    property int messageY:0
    property string action
    property color actionColor: "green"
    property bool actionVisible: false
//    FontLoader{
//        id:mainFont
//        source: "./font/fa-regular-400.ttf"
//    }

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
            text: action.message+" "
            color: "#9ca3af"
            font.pixelSize: 12
            font.bold: true
//            font.family: mainFont.name
            lineHeight: 1.2
            width: card1.bodyWidth
//            Button{
//                text: action.action+" >"
//                width: actionName.width+16
//                height: actionName.height+3
//                backgroundColor: action.actionColor
//                radius: 12
//                x: mymessage.text.length+action.messageX
//                y:action.messageY
//                visible: action.actionVisible
//            }
            Rectangle{
                id:actionBut
                color: action.actionColor
                width: actionName.width+16
                height: actionName.height+4
                radius: 12
                x: mymessage.text.length+action.messageX
                y:action.messageY
                visible: action.actionVisible
                Text {
                    id: actionName
                    text: action.action+" >"
                    color: "white"
                    font.pixelSize: 12
                    anchors.centerIn: parent
                }
            }
            wrapMode: Text.WordWrap
        }
    }
}
