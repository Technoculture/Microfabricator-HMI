import QtQuick 2.15

Item {
    id:card
    property double cardOpacity:1

    property string headText

    property string body0Text
    property int body0X:0
    property int body0Y:0
    property string body1Text
    property int body1X:0
    property int body1Y:0
    property bool body1Visible:false
    Rectangle{
        id:display
        width: 104
        height: 145.6
        color: "black"
        radius: 20
        opacity: card.cardOpacity
        Text {
            id: mt0
            text: card.headText
            color: "white"
            x:11
            y:14
            font.pixelSize: 15
            width: 86
            wrapMode: Text.WordWrap
        }
        Rectangle {
            id:rec
            radius: 20
            width:104
            height: 80
            color: "black"
            Text {
                id: t0
                text: card.body0Text
                x:card.body0X
                y:card.body0Y
                wrapMode: Text.WordWrap
                color: "orange"
                font.pixelSize: 24
            }
            Text {
                id: t1
                text: card.body1Text
                x:card.body1X
                y:card.body1Y
                wrapMode: Text.WordWrap
                color: "white"
                font.pixelSize: 15
                visible: card.body1Visible
            }
            Rectangle {
                width: parent.radius
                height: parent.radius
                anchors {
                    top: parent.top
                    right: parent.right
                    left: parent.left
                }
                color: parent.color
            }
            anchors.bottom: parent.bottom
        }
    }
}
