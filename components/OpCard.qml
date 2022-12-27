import QtQuick 2.15
import QtGraphicalEffects 1.12
import "../assets"

Item {
    id:card1
    property int cardX:0
    property int cardY:0
    property double cardWidth
    property double cardHeight

    property string title
    property int titleX
    property int titleY
    property int titleFontSize

    property double iconWidth

    property string buttonSource
    property double buttonWidth:0
    property double buttonHeight:0
//    property color buttonClickColor:"transparent"

    property int historyLogHeight1
    property int historyLogHeight2
    property int historyLogHeight3
    property int historyLogHeight4
    property int historyLogHeight5
    property int historyLogHeight6
    property int historyLogHeight7

    property int bodyHeight
    property int bodyWidth
    property double progressOpacity:1
    property double historyOpacity:0
    Rectangle{
        id:display
        width: card1.cardWidth
        height: card1.cardHeight
        color: "#232323"
        radius: 20
        clip: true
        x:card1.cardX
        y:card1.cardY
        Text {
            id: mt0
            text: card1.title
            color: "white"
            x:card1.titleX
            y:card1.titleY
            font.pixelSize: card1.titleFontSize
            wrapMode: Text.WordWrap
        }
        Button{
            id: but
            radius: 20
            backgroundColor: "#232323"
            iconImage: card1.buttonSource
            sidePadding: 20
            height: card1.buttonHeight!=0? card1.buttonHeight:implicitHeight
            width: card1.buttonWidth!=0? card1.buttonWidth:implicitWidth
            anchors.right: parent.right
            onClicked: {
                if(but.state==='')
                    but.state='s1'
                else
                    but.state=''
            }
            states: State {
                name: "s1"
                PropertyChanges {target: historyFull;visible:true}
                PropertyChanges {target: cards;visible:false}
            }
            iconSize: iconWidth!=0?iconWidth:28
//            onPressed: backgroundColor= card1.buttonClickColor
//            onReleased: backgroundColor ="transparent"
        }
        Rectangle{
            id:progressTotal
            color: "transparent"
            width: card1.cardWidth
            height: card1.bodyHeight
            clip: true
            opacity: card1.progressOpacity
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
                    width: 0.3*progressTotal.width
                    height: 200
                    color: "transparent"
                    clip: true
                    Rectangle {
                        id: clipped1
                        width: progressTotal.width
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
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                    }
                }
            }
            anchors.bottom: parent.bottom
        }
        Rectangle{
            id:historyList
            opacity:card1.historyOpacity
            width: card1.cardWidth
            height: card1.cardHeight-but.height
            color: "Black"
            radius: 20
            clip: true
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
            Rectangle{
                width: historyList.width
                height: historyList.height
                color: "transparent"
                x:8
                y:8
                Column{
                    Item{
                        id:m1
                        width: 220
                        height: card1.historyLogHeight1
                        Action{
                            time: "23:56"
                            message: "Light Engine Auto-calliberation"
                        }
                    }
                    Item{
                        id:m2
                        width: 220
                        height: card1.historyLogHeight2
                        Action{
                            time: "23:56"
                            message: "Exposure initiated for 2m 30s at 321mJ/cm2 (21%)"
                        }
                    }
                    Item{
                        id:m3
                        width: 220
                        height: card1.historyLogHeight3
                        Action{
                            time: "23:56"
                            message: "Exposure complete "
                            action: "Redo"
                            actionVisible: true
                            actionColor: "green"
                            messageX: 100
                        }
                    }
                    Item{
                        id:m4
                        width: 220
                        height: card1.historyLogHeight4
                        Action{
                            time: "23:56"
                            message: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)"
                        }
                    }
                    Item{
                        id:m5
                        width: 220
                        height: card1.historyLogHeight5
                        Action{
                            time: "23:56"
                            message: "Exposure complete "
                            action: "Redo"
                            actionVisible: true
                            actionColor: "green"
                            messageX: 100
                        }
                    }
                    Item{
                        id:m6
                        width: 220
                        height: card1.historyLogHeight6
                        Action{
                            time: "23:56"
                            message: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)"
                        }
                    }
                    Item{
                        id:m7
                        width: 220
                        height: card1.historyLogHeight7
                        Action{
                            time: "23:56"
                            message: "Exposure Paused after 32s of exposure "
                            action: "Resume"
                            actionVisible: true
                            actionColor: "#5f849c"
                            messageX: 204
                        }
                    }
                }
            }
            anchors.bottom: parent.bottom
        }
    }
}
