import QtQuick 2.15
import QtGraphicalEffects 1.12

Item {
    id:card
    property string title
    signal pressed()
    signal released()
    property string status
    property int statusX:0
    property int statusY:0
    property string info
    property int infoX:0
    property int infoY:0
    property bool infoVisible:false
    Rectangle{
        id:display
        width: 104
        height: 145.6
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
            text: card.title
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
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
                text: card.status
                x:card.statusX
                y:card.statusY
                wrapMode: Text.WordWrap
                color: "#ff7b00"
                font.pixelSize: 24
            }
            Text {
                id: t1
                text: card.info
                x:card.infoX
                y:card.infoY
                wrapMode: Text.WordWrap
                color: "white"
                font.pixelSize: 15
                visible: card.infoVisible
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
        MouseArea{
            anchors.fill: parent
            onPressed: card.pressed()
            onReleased: card.released()
        }
    }
}
