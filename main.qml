import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.4

Window {
    title: "MicroFabricator"
    visible: true
    width: 860
    height: 500
    Item{
        id:mygradient
        width: 860
        height: 500
        LinearGradient{
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(mygradient.width, mygradient.height)
            gradient: Gradient{
                GradientStop{
                    position: 0
                    color: "#ffffff"
                }
                GradientStop{
                    position: 0.1
                    color: "#ebf3fa"
                }
                GradientStop{
                    position: 1
                    color: "#8898a6"
                }
            }
        }
    }

    Grid{
        padding: 40
        spacing: 24
        rows: 2
        columns: 2
        Rectangle{
            width:234
            height: 335.6
            color: "transparent"
            radius: 20
            Rectangle{
                id:display
                width:234
                height: 325.6
                color:"#262626"
                radius: 20
                clip: true
                anchors.centerIn: parent
                layer.enabled: true
                layer.effect: DropShadow{
                    transparentBorder: true
                    verticalOffset: 7
                    color: "#303030"
                    radius: 50
                    samples: 101
                }
                Rectangle{
                    id:mac1
                    width: 234
                    height: 272
                    color: "transparent"
                    clip: true
                    SwipeView {
                        id: view
                        currentIndex: indicator.currentIndex
                        anchors.fill: parent

                        Item {
                            id: firstPage
                            Image {
                                id: pic1
                                source: "mfab-naked.d5f2d608.png"
                                x:10
                                y:10
                                width: 224
                                height: 262
                            }
                        }
                        Item {
                            id: secondPage
                            Image {
                                id: pic2
                                source: "slider.6d5ccd2b.png"
                                x:-122
                                y:15
                                width: 464
                                height: 240
                            }
                        }
                        Item {
                            id: thirdPage
                            Image {
                                id: pic3
                                source: "le-front.15970e90.png"
                                x:-119
                                y:15
                                width: 464
                                height: 240
                            }
                        }
                    }
                    PageIndicator {
                        id: indicator
                        count: view.count
                        currentIndex: view.currentIndex
                        interactive: true
                        anchors.bottom: view.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        delegate: Rectangle{
                            implicitWidth: 12
                            implicitHeight: 2
                            color: "white"
                            opacity: index === indicator.currentIndex ? 1 : pressed ? 0.5 : 0.3
                        }
                        Behavior on opacity{
                            OpacityAnimator {
                                duration: 100
                            }
                        }
                    }
                }

                Rectangle{
                    id:over1
                    width: 234
                    height: 136
                    anchors.bottom: buttons.top
                    color: "black"
                    visible: false
                    Text {
                        id: ot1
                        text:"Are you sure, this action will unlock the stage module 4S and allow you to remove it out"
                        width: 201
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        color: "white"
                        y:10
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle{
                        id:but1
                        width: 197
                        height: 40
                        radius: 10
                        color: "#f54949"
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 72
                        Text {
                            text: "Eject"
                            x:25
                            y:8
                            font.pixelSize: 18
                        }
                        Image {
                            id: i1
                            source: "Padlock.png"
                            width: 24
                            height: 24
                            x:150
                            y:8
                        }
                    }
                }
                Rectangle{
                    id:over2
                    width: 234
                    height: 136
                    anchors.bottom: buttons.top
                    color: "black"
                    visible: false
                    Text {
                        id: ot2
                        text:"Are you sure, this action will unlock the light engine module and allow you to remove it out"
                        width: 201
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        color: "white"
                        y:10
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle{
                        id:but2
                        width: 197
                        height: 40
                        radius: 10
                        color: "#f54949"
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 72
                        Text {
                            text: "Eject"
                            x:25
                            y:8
                            font.pixelSize: 18
                        }
                        Image {
                            id: i2
                            source: "Padlock.png"
                            width: 24
                            height: 24
                            x:150
                            y:8
                        }
                    }
                }

                Rectangle {
                    id:buttons
                    radius: 20
                    width:234
                    height: 53.2
                    color: "transparent"
                    Grid{
                        columns: 2
                        Rectangle{
                            id:rec1
                            width: 98.25
                            height: 53.2
                            color: "black"
                            radius: 20
                            Rectangle {
                                width: parent.radius
                                height: parent.radius
                                anchors.left: parent.left
                                color: parent.color
                            }
                            Rectangle {
                                width: parent.radius
                                height: parent.radius
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.top: parent.top
                                color: parent.color
                            }
                            Text {
                                id: t
                                text: "4S"
                                x:19
                                y:13
                                color: "white"
                                font.pixelSize: 22
                            }
                            Image {
                                id: img
                                source: "Forward.png"
                                width: 26
                                height: 26
                                x: 65
                                y:10
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MouseArea{
                                id:ma1
                                anchors.fill: rec1
                                onClicked: {
                                    if(rec1.state===''){
                                        rec1.state='st1'
                                        rec2.state=''
                                    }
                                    else
                                        rec1.state=''
                                }
                            }
                            states: State {
                                name: "st1"
                                PropertyChanges {
                                    target: over1
                                    visible:true
                                }
                                PropertyChanges {
                                    target: img
                                    rotation:270
                                }
                            }
                        }
                        Rectangle{
                            id:rec2
                            width: 135.75
                            height: 53.2
                            color: "black"
                            radius: 20
                            Rectangle {
                                width: parent.radius
                                height: parent.radius
                                anchors.right: parent.right
                                color: parent.color
                            }
                            Rectangle {
                                width: parent.radius
                                height: parent.radius
                                anchors.left: parent.left
                                anchors.bottom: parent.bottom
                                anchors.top: parent.top
                                color: parent.color
                            }
                            Text {
                                id: t1
                                text: "365nm"
                                x:19
                                y:13
                                color: "white"
                                font.pixelSize: 22
                            }

                            Image {
                                id: img1
                                source: "Forward.png"
                                width: 26
                                height: 26
                                x: 97
                                y:10
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MouseArea{
                                id:ma2
                                anchors.fill: rec2
                                onClicked: {
                                    if(rec2.state===''){
                                        rec2.state='st2'
                                        rec1.state=''
                                    }
                                    else
                                        rec2.state=''
                                }
                            }
                            states: State {
                                name: "st2"
                                PropertyChanges {
                                    target: over2
                                    visible:true
                                }
                                PropertyChanges {
                                    target: img1
                                    rotation:270
                                }
                            }
                        }
                    }
                    anchors.bottom: parent.bottom
                }
            }
        }
        Rectangle{
            id:historyFull
            width:522
            height: 335.6
            color:"transparent"
            radius: 20
            visible: false
            Rectangle{
                width:512
                height: 325.6
                color:"#262626"
                radius: 20
                anchors.centerIn: parent
                OpCard{
                    cardWidth: 512
                    cardHeight: 325.6
                    headText: "History"
                    headSize: 18
                    headX: 18
                    headY: 10
                    headBut: "maximize-2.png"
                    headButHeight: 40
                    headButWidth: 66
                    headWidth: 26
                    headHeight: 26
                    bodyOpacity: 0
                    bodyTextOpcaity: 0.8
                    bodyWidth: 456
                }
                layer.enabled: true
                layer.effect: DropShadow{
                    transparentBorder: true
                    verticalOffset: 10
                    color: "#303030"
                    radius: 40
                    samples: 81
                }
            }
        }
        Grid{
            id:cards
            rows: 2
            spacing: 24
            Grid{
                columns: 4
                spacing: 24
                Rectangle{
                    id:r1
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        headText: "Wafer Stage"
                        body0Text: "Open"
                        body0X: 22
                        body0Y: 24
                    }
                    color: "transparent"
                    MouseArea{
                        id:mouse1
                        anchors.fill: parent
                        onPressed: {
                            r1.color="orange"
                        }
                        onReleased: {
                            r1.color="transparent"
                        }
                    }
                }
                Rectangle{
                    id:r2
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        headText: "Wafer Clamp"
                        body0Text: "Off"
                        body0X: 32
                        body0Y: 24
                    }
                    color: "transparent"
                    MouseArea{
                        id:mouse2
                        anchors.fill: parent
                        onPressed: {
                            r2.color="orange"
                        }
                        onReleased: {
                            r2.color="transparent"
                        }
                    }
                }
                Rectangle{
                    id:r3
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        headText: "Wafer Mask Gap"
                        body0Text: "2.8μm"
                        body0X: 19
                        body0Y: 24
                    }
                    color: "transparent"
                    MouseArea{
                        id:mouse3
                        anchors.fill: parent
                        onPressed: {
                            r3.color="orange"
                        }
                        onReleased: {
                            r3.color="transparent"
                        }
                    }
                }
                Rectangle{
                    id:r4
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        headText: "Vibration"
                        body0Text: "Ok"
                        body0X: 36
                        body0Y: 24
                    }
                    color: "transparent"
                    MouseArea{
                        id:mouse4
                        anchors.fill: parent
                        onPressed: {
                            r4.color="orange"
                        }
                        onReleased: {
                            r4.color="transparent"
                        }
                    }
                }
            }
            Grid{
                columns: 3
                spacing: 24
                Rectangle{
                    id:r5
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        headText: "Light Intensity"
                        body0Text: "21%"
                        body0X: 12
                        body0Y: 15
                        body1Text: "321 mJ/cm<sup>2</sup>"
                        body1Visible: true
                        body1X: 12
                        body1Y: 44
                    }
                    color: "transparent"
                    MouseArea{
                        id:mouse5
                        anchors.fill: parent
                        onPressed: {
                            r5.color="orange"
                        }
                        onReleased: {
                            r5.color="transparent"
                        }
                    }
                }
                Rectangle{
                    id:r6
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        headText: "Duration"
                        body0Text: "112s"
                        body0X: 12
                        body0Y: 15
                        body1Text: "1m 32s"
                        body1Visible: true
                        body1X: 12
                        body1Y: 44
                    }
                    color: "transparent"
                    MouseArea{
                        id:mouse6
                        anchors.fill: parent
                        onPressed: {
                            r6.color="orange"
                        }
                        onReleased: {
                            r6.color="transparent"
                        }
                    }
                }
                Rectangle{
                    id:history
                    width:254
                    height: 155.6
                    color:"transparent"
                    radius: 20
                    OpCard{
                        cardX: 5
                        cardY: 5
                        cardWidth: 244
                        cardHeight: 145.6
                        headText: "History"
                        headSize: 18
                        headX: 18
                        headY: 10
                        headBut: "maximize-2.png"
                        headButHeight: 40
                        headButWidth: 56
                        headWidth: 26
                        headHeight: 26
                        bodyOpacity: 0
                        bodyTextOpcaity: 0.8
                        bodyWidth: 208
                    }
                    layer.enabled: true
                    layer.effect: DropShadow{
                        transparentBorder: true
                        verticalOffset: 8
                        color: "#303030"
                        radius: 40
                        samples: 81
                    }
                }
            }
        }
        Rectangle{
            id:play
            width:224
            height: 70.8
            color:"transparent"
            radius: 20
            clip: true
            OpCard{
                cardWidth: 234
                cardHeight: 60.8
                headText: "00:22:19"
                headSize: 24
                headX: 20
                headY: 14
                headBut: "play-circle.png"
                headButHeight: 52.8
                headButWidth: 91.49
                headWidth: 36
                headHeight: 36
                bodyHeight: 8
            }
            layer.enabled: true
            layer.effect: DropShadow{
                transparentBorder: true
                verticalOffset: 4
                color: "#303030"
                radius: 40
                samples: 81
                spread: 0
            }
        }
    }
}
