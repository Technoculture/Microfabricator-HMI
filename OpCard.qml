import QtQuick 2.15
import QtGraphicalEffects 1.12

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
    property int bodyWidth
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
                    target: historyFull
                    visible:true
                }
                PropertyChanges {
                    target: cards
                    visible:false
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
                color: "#6e5e4b"
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
                        width: 100
                        height: 30
                        radius: 20
                        gradient: Gradient{
                            orientation: Gradient.Horizontal
                            GradientStop{
                                position: 0
                                color: "#ffbb00"
                            }
                            GradientStop{
                                position: 0.8
                                color: "#ff7b00"
                            }
                        }
//                        color: "#ff7b00"
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
                text: "<font color=\"orange\">23:56></font> Light Engine Auto-calliberation<br>
<font color=\"orange\">23:56></font> Exposure initiated for 2m 30s at 321mJ/cm2 (21%)<br>
<font color=\"orange\">23:56></font> Exposure complete <font color=\"green\">Redo</font><br>
<font color=\"orange\">23:56></font> Exposure initiated for 1m 10s at 167mJ/cm2 (12%)<br>
<font color=\"orange\">23:56></font> Exposure complete <font color=\"green\">Redo</font><br>
<font color=\"orange\">23:56></font> Exposure initiated for 1m 10s at 167mJ/cm2 (12%)<br>
<font color=\"orange\">23:56></font> Exposure Paused after 32s of exposure <font color=\"cyan\">Resume</font>"
                color: "#9ca3af"
                font.pixelSize: 12
                font.bold: true
                lineHeight: 1.2
                x:8
                y:18
                width: card1.bodyWidth
                wrapMode: Text.WordWrap
//                anchors.centerIn: parent
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
