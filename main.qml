import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.4
import "./components"
import "./assets"

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
                    position: 0.4
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
        rows: 2;columns: 2
        Rectangle{
            width:234
            height: 335.6
            color: "transparent"
            radius: 20
            Rectangle{
                id:display
                width:234
                height: 325.6
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
                clip: true
                anchors.centerIn: parent
                layer.enabled: true
                layer.effect: DropShadow{
                    transparentBorder: true
                    verticalOffset: 8
                    color: "#636363"
                    radius: 30
                    samples: 61
                }
                Rectangle{
                    id:mac1
                    width: 234
                    height: 267
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
                                source: "assets/image-1.png"
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
                                source: "assets/image-2.png"
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
                                source: "assets/image-3.png"
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
                    Button{
                        text: "Eject"
                        radius: 10
                        backgroundColor: "#f54949"
                        textColor: "black"
                        iconImage: "../assets/Padlock.png"
                        sidePadding: 25
                        height: 40
                        iconSize: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:72
                        onClicked: rec1.state=''
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
                    Button{
                        text: "Eject"
                        radius: 10
                        backgroundColor: "#f54949"
                        textColor: "black"
                        iconImage: "../assets/Padlock.png"
                        sidePadding: 25
                        height: 40
                        iconSize: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:72
                        onClicked: rec2.state=''
                    }
                }

                Rectangle {
                    id:buttons
                    radius: 20
                    width:234
                    height: 58.2
                    border{
                        color:"transparent"
                        width: 5
                    }
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
                                source: "assets/Forward.png"
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
                                onPressed: buttons.border.color="orange"
                                onReleased: buttons.border.color="transparent"
                            }
                            states: State {
                                name: "st1"
                                PropertyChanges {
                                    target: over1
                                    visible:true
                                }
                                PropertyChanges {
                                    target: img
                                    rotation:-90
                                }
                            }
                            transitions: [
                                Transition {
                                    from: ""
                                    to: "st1"
                                    reversible: true
                                    NumberAnimation { properties: "rotation"; duration: 100; easing.type: Easing.InOutQuad }
                                }
                            ]
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
                                source: "assets/Forward.png"
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
                                onPressed: buttons.border.color="orange"
                                onReleased: buttons.border.color="transparent"
                            }
                            states: State {
                                name: "st2"
                                PropertyChanges {
                                    target: over2
                                    visible:true
                                }
                                PropertyChanges {
                                    target: img1
                                    rotation:-90
                                }
                            }
                            transitions: [
                                Transition {
                                    from: ""
                                    to: "st2"
                                    reversible: true
                                    NumberAnimation { properties: "rotation"; duration: 100; easing.type: Easing.InOutQuad }
                                }
                            ]
                        }
                        anchors.bottom: parent.bottom
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
                    title: "History"
                    titleFontSize: 18
                    buttonSource: "../assets/maximize-2.png"
                    buttonClickColor: "#b36705"
                    buttonHeight: 42
                    iconWidth: 26
                    progressOpacity: 0
                    historyOpacity: 1
                    bodyWidth: 320
                    historyLogHeight1: 18
                    historyLogHeight2: 18
                    historyLogHeight3: 18
                    historyLogHeight4: 18
                    historyLogHeight5: 18
                    historyLogHeight6: 18
                    historyLogHeight7: 18
                }
                layer.enabled: true
                layer.effect: DropShadow{
                    transparentBorder: true
                    verticalOffset: 10
                    color: "#636363"
                    radius: 35
                    samples: 71
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
                        title: "Wafer Stage"
                        status: "Open"
                        onPressed:parent.color="orange"
                        onReleased:parent.color="transparent"
                    }
                    color: "transparent"
                }
                Rectangle{
                    id:r2
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        title: "Wafer Clamp"
                        status: "Off"
                        onPressed:parent.color="orange"
                        onReleased:parent.color="transparent"
                    }
                    color: "transparent"
                }
                Rectangle{
                    id:r3
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        title: "Wafer Mask Gap"
                        status: "2.8μm"
                        onPressed:parent.color="orange"
                        onReleased:parent.color="transparent"
                    }
                    color: "transparent"
                }
                Rectangle{
                    id:r4
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        title: "Vibration"
                        status: "Ok"
                        onPressed:parent.color="orange"
                        onReleased:parent.color="transparent"
                    }
                    color: "transparent"
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
                        title: "Light Intensity"
                        status: "21%"
                        info: "321 mJ/cm2"
                        onPressed:parent.color="orange"
                        onReleased:parent.color="transparent"
                    }
                    color: "transparent"
                }
                Rectangle{
                    id:r6
                    radius: 20
                    width: 114
                    height: 155.6
                    Card{
                        title: "Duration"
                        status: "112s"
                        info: "1m 32s"
                        onPressed:parent.color="orange"
                        onReleased:parent.color="transparent"
                    }
                    color: "transparent"
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
                        title: "History"
                        titleFontSize: 18
                        buttonSource: "../assets/maximize-2.png"
                        buttonHeight: 42
                        iconWidth: 26
                        buttonClickColor: "#b36705"
                        progressOpacity: 0
                        historyOpacity: 1
                        bodyWidth: 165
                        historyLogHeight1: 32
                        historyLogHeight2: 32
                        historyLogHeight3: 18
                        historyLogHeight4: 32
                        historyLogHeight5: 18
                        historyLogHeight6: 32
                        historyLogHeight7: 18
                    }
                    layer.enabled: true
                    layer.effect: DropShadow{
                        transparentBorder: true
                        verticalOffset: 8
                        color: "#636363"
                        radius: 30
                        samples: 61
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
                title: "00:22:19"
                titleFontSize: 24
                buttonSource: "../assets/play-circle.png"
                buttonWidth: 82
                iconWidth: 36
                bodyHeight: 8
            }
            layer.enabled: true
            layer.effect: DropShadow{
                transparentBorder: true
                verticalOffset: 5
                color: "#636363"
                radius: 30
                samples: 61
                spread: 0
            }
        }
//        Button{
//            text: "Eject"
//            radius: 10
//            backgroundColor: "orange"
//            textColor: "black"
//            iconImage: "assets/Padlock.png"
//            sidePadding: 26
//            height: 46
//        }
    }
}
