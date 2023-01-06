import QtQuick 2.15
import QtGraphicalEffects 1.12
import "../assets"

Item {
    id:root
    property int cardX:0
    property int cardY:0
    property double cardWidth:0
    property double cardHeight:0

    property alias title:heading.text
    property int titleFontSize

    property double iconWidth

    property string buttonSource
    property double buttonWidth:0
    property double buttonHeight:0
    property color buttonClickColor:"black"

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
        width: cardWidth
        height: cardHeight
        color: "#232323"
        radius: 20
        clip: true
        x:cardX
        y:cardY
        Text {
            id: heading
            color: "white"
            x:19
            y:10
            font.pixelSize: titleFontSize
            wrapMode: Text.WordWrap
        }
        Button{
            id: but
            radius: 20
            backgroundColor: "#232323"
            iconImage: buttonSource
            sidePadding: 20
            height: buttonHeight!=0? buttonHeight:implicitHeight
            width: buttonWidth!=0? buttonWidth:implicitWidth
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
            onPressed: backgroundColor= buttonClickColor
            onReleased: backgroundColor ="transparent"
        }
        Rectangle{
            id:progressTotal
            color: "transparent"
            width: cardWidth
            height: bodyHeight
            clip: true
            opacity: progressOpacity
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
            opacity:historyOpacity
            width: cardWidth
            height: cardHeight-but.height
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
                        height: historyLogHeight1
                        Action{
                            time: "23:56"
                            message: "Light Engine Auto-calliberation"
                        }
                    }
                    Item{
                        id:m2
                        width: 220
                        height: historyLogHeight2
                        Action{
                            time: "23:56"
                            message: "Exposure initiated for 2m 30s at 321mJ/cm2 (21%)"
                        }
                    }
                    Item{
                        id:m3
                        width: 220
                        height: historyLogHeight3
                        Action{
                            time: "23:56"
                            message: "Exposure complete "
                            action: "Redo"
                            actionColor: "green"
                        }
                    }
                    Item{
                        id:m4
                        width: 220
                        height: historyLogHeight4
                        Action{
                            time: "23:56"
                            message: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)"
                        }
                    }
                    Item{
                        id:m5
                        width: 220
                        height: historyLogHeight5
                        Action{
                            time: "23:56"
                            message: "Exposure complete "
                            action: "Redo"
                            actionColor: "green"
                        }
                    }
                    Item{
                        id:m6
                        width: 220
                        height: historyLogHeight6
                        Action{
                            time: "23:56"
                            message: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)"
                        }
                    }
                    Item{
                        id:m7
                        width: 220
                        height: historyLogHeight7
                        Action{
                            time: "23:56"
                            message: "Exposure Paused after 32s of exposure "
                            action: "Resume"
                            actionColor: "#5f849c"
                        }
                    }
                }
            }
            anchors.bottom: parent.bottom
        }
    }
}
