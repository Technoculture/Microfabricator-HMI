import QtQuick 2.15
import QtGraphicalEffects 1.12

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
//        color: "#262626"
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{
                position: 0
                color: "#262626"
            }
            GradientStop{
                position: 0.4
                color: "#181818"
            }
            GradientStop{
                position: 1
                color: "#262626"
            }
        }
        radius: 20
        x:5
        y:5
        layer.enabled: true
        layer.effect: DropShadow{
            transparentBorder: true
            verticalOffset: 5
            color: "#636363"
            radius: 30
            samples: 61
        }
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
                color: "#ff7b00"
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
