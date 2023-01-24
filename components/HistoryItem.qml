import QtQuick 2.15

Item {
    id:root
    implicitWidth: 220
    implicitHeight: 18
    property string time: "00:00"
    property string message: ""
    property string action: ""
    property color actionColor: "green"
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Grid{
            columns: 2
            Text{
                id: timeStamp
                text: time + "> "
                color: "orange"
                font.pixelSize: 12
                font.bold: true
            }
            Text{
                id: record
                text: message + " "
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
                    x: record.paintedWidth
                    visible: action !== ""
                }
                wrapMode: Text.WordWrap
            }
        }
    }
}
