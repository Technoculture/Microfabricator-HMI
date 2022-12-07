import QtQuick 2.15

Item {
    id:card1
    property double cardWidth
    property double cardHeight

    property string headText
    property int headX
    property int headY
    property int headSize
    property string headBut
    property double headButWidth
    property double headButHeight
    property double headWidth
    property double headHeight

    property int bodyHeight
    property double bodyOpacity:1
    property double bodyTextOpcaity:0
    Rectangle{
        id:display
        width: card1.cardWidth
        height: card1.cardHeight
        color: "black"
        radius: 20
        clip: true
        Text {
            id: mt0
            text: card1.headText
            color: "white"
            x:card1.headX
            y:card1.headY
            font.pixelSize: card1.headSize
            wrapMode: Text.WordWrap
        }
        Rectangle {
            id: but
            width: card1.headButWidth
            height: card1.headButHeight
            color: "transparent"
            clip: true
            Rectangle {
                id: clipped
                width: 200
                height: 200
                radius: 20
                color: "transparent"
                anchors.right: parent.right
            }
            Image {
                id: img1
                source: card1.headBut
                width: card1.headWidth
                height: card1.headHeight
                anchors.centerIn: parent
            }
            anchors.right: parent.right

            MouseArea{
                id:mouseArea
                anchors.fill: but
                onClicked: {
                    if(but.state==='')
                        but.state='s1'
                    else
                        but.state=''
                }
            }
            states: State {
                name: "s1"
                PropertyChanges {
                    target: history
                    scale:1.4
                }
            }
        }
        Rectangle{
            id:progressTotal
            color: "transparent"
            width: card1.cardWidth
            height: card1.bodyHeight
            clip: true
            opacity: card1.bodyOpacity
            Rectangle {
                id: progress
                width: progressTotal.width
                height: 200
                radius: 20
                opacity: 0.6
                color: "orange"
                clip: true
                anchors.bottom: parent.bottom
                Rectangle {
                    id: progres2
                    width: 70
                    height: 200
                    color: "transparent"
                    clip: true

                    Rectangle {
                        id: clipped1
                        width: 300
                        height: 30
                        radius: 20
                        color: "orange"
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                    }
                }
            }
            anchors.bottom: parent.bottom
        }
        Rectangle{
            id:text1
            opacity:card1.bodyTextOpcaity
            width: card1.cardWidth
            height: card1.cardHeight-card1.headButHeight
            color: "Black"
            radius: 20
            Text {
                id: t1
                text: "History List"
                color: "Orange"
                font.pixelSize: 24
                font.bold: true
                anchors.centerIn: parent
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
