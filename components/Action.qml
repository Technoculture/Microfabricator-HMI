import QtQuick 2.15

Item {
    id:root
    property string time:"00:00"
    property string message:""
    property string action:""
    property color actionColor: "green"

    Grid{
        columns: 2
        Text{
            id:mytime
            text: time+"> "
            color: "orange"
            font.pixelSize: 12
            font.bold: true
        }
        Text{
            id:mymessage
            text: message+" "
            color: "#9ca3af"
            font.pixelSize: 12
            font.bold: true
            lineHeight: 1.2
            width: bodyWidth
            Button{
                text: action+" >"
                radius: 12
                backgroundColor: actionColor
                height: 18
                sidePadding: 8
                labelFontSize: 12
                x: mymessage.paintedWidth
                visible: action!==""
            }
            wrapMode: Text.WordWrap
        }
    }
}
