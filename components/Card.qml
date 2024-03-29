import QtQuick 2.15
import QtGraphicalEffects 1.12

Item {
    id: root
    property alias title: heading.text
    signal pressed()
    signal released()
    signal clicked()
    property alias status: t0.text
    property alias info: t1.text
    Rectangle{
        id: cardArea
        width: 106
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
        radius: 17
        x: 5
        y: 5
        layer.enabled: true
        layer.effect: DropShadow{
            transparentBorder: true
            verticalOffset: 5
            color: "#636363"
            radius: 30
            samples: 61
        }
        Text {
            id: heading
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 14
            font.pixelSize: 15
            width: parent.width-18
            wrapMode: Text.WordWrap
        }
        Rectangle {
            id: content
            radius: 20
            width: 104
            height: 80
            color: "black"
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
            clip: true
            Column{
                x: 12
                spacing: 5
                Text {
                    id: t0
                    color: "#ff7b00"
                    font.pixelSize: 22
                }
                Text {
                    id: t1
                    color: "white"
                    font.pixelSize: 15
                    visible: info !== ""
                }
                anchors.verticalCenter: parent.verticalCenter
            }
            anchors.bottom: parent.bottom
        }
        MouseArea{
            anchors.fill: parent
            onClicked: root.clicked()
            onPressed: root.pressed()
            onReleased: root.released()
        }
    }
}
