import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.4
import "./components"
import "./assets"

Window {
    id:root
    title: "MicroFabricator"
    visible: true
    width: 850
    height: 480
    Item{
        id:backgroundGradient
        width: 850
        height: 480
        LinearGradient{
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(backgroundGradient.width, backgroundGradient.height)
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
        anchors.centerIn: parent
        spacing: 26
        columns: 2
        Rectangle{
            width: 234
            height: 332.6
            color: "transparent"
            radius: 20
            Rectangle{
                id: carousel
                width:234
                height: 317.6
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
                    id: carouselItem
                    width: 234
                    height: 262
                    color: "transparent"
                    clip: true
                    SwipeView {
                        id: view
                        currentIndex: indicator.currentIndex
                        anchors.fill: parent

                        Item {
                            id: firstPage
                            Image {
                                source: "assets/Carousel-item-1.png"
                                x:10
                                y:10
                                width: 224
                                height: 262
                            }
                        }
                        Item {
                            id: secondPage
                            Image {
                                source: "assets/Carousel-item-2.png"
                                x:-122
                                y:15
                                width: 464
                                height: 240
                            }
                        }
                        Item {
                            id: thirdPage
                            Image {
                                source: "assets/Carousel-item-3.png"
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
                    id:overlay1
                    width: 234
                    height: 136
                    anchors.bottom: buttons.top
                    color: "black"
                    visible: false
                    Text {
                        id: overlayText1
                        text:"Are you sure, this action will unlock the stage module 4S and allow you to remove it out"
                        width: 201
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        color: "white"
                        topPadding: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Button{
                        text: "Eject"
                        radius: 10
                        backgroundColor: "#f54949"
                        textColor: "black"
                        iconImage: "../assets/Lock.png"
                        sidePadding: 25
                        height: 40
                        iconSize: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:72
                        onClicked: {
                            button1.state=''
                            buttonText1.text=""
                            maintainanceMode.visible=true
                        }
                    }
                }
                Rectangle{
                    id:overlay2
                    width: 234
                    height: 136
                    anchors.bottom: buttons.top
                    color: "black"
                    visible: false
                    Text {
                        id: overlayText2
                        text:"Are you sure, this action will unlock the light engine module and allow you to remove it out"
                        width: 201
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        color: "white"
                        topPadding: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Button{
                        text: "Eject"
                        radius: 10
                        backgroundColor: "#f54949"
                        textColor: "black"
                        iconImage: "../assets/Lock.png"
                        sidePadding: 25
                        height: 40
                        iconSize: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:72
                        onClicked: {
                            button2.state=''
                            buttonText2.text=""
                            maintainanceMode.visible=true
                        }
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
                            id:button1
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
                                id: buttonText1
                                text: moduleHistoryTable.roleFromRow(0, "stage")
                                x:19
                                y:13
                                color: "white"
                                font.pixelSize: 22
                            }
                            Image {
                                id: buttonIcon1
                                source: "assets/Right-arrow.png"
                                width: 26
                                height: 26
                                x: 65
                                y:10
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MouseArea{
                                id: mouseArea1
                                anchors.fill: button1
                                onClicked: {
                                    if(button1.state===''){
                                        button1.state='overlay1Open'
                                        button2.state=''
                                    }
                                    else
                                        button1.state=''
                                }
                                onPressed: buttons.border.color="orange"
                                onReleased: buttons.border.color="transparent"
                            }
                            states: State {
                                name: "overlay1Open"
                                PropertyChanges {
                                    target: overlay1
                                    visible:true
                                }
                                PropertyChanges {
                                    target: buttonIcon1
                                    rotation:-90
                                }
                            }
                            transitions: [
                                Transition {
                                    from: ""
                                    to: "overlay1Open"
                                    reversible: true
                                    NumberAnimation { properties: "rotation"; duration: 100; easing.type: Easing.InOutQuad }
                                }
                            ]
                        }
                        Rectangle{
                            id:button2
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
                                id: buttonText2
                                text: moduleHistoryTable.roleFromRow(0, "light_engine")
                                x:19
                                y:13
                                color: "white"
                                font.pixelSize: 22
                            }

                            Image {
                                id: buttonIcon2
                                source: "assets/Right-arrow.png"
                                width: 26
                                height: 26
                                x: 97
                                y:10
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MouseArea{
                                id: mouseArea2
                                anchors.fill: button2
                                onClicked: {
                                    if(button2.state===''){
                                        button2.state='overlay2Open'
                                        button1.state=''
                                    }
                                    else
                                        button2.state=''
                                }
                                onPressed: buttons.border.color="orange"
                                onReleased: buttons.border.color="transparent"
                            }
                            states: State {
                                name: "overlay2Open"
                                PropertyChanges {
                                    target: overlay2
                                    visible:true
                                }
                                PropertyChanges {
                                    target: buttonIcon2
                                    rotation:-90
                                }
                            }
                            transitions: [
                                Transition {
                                    from: ""
                                    to: "overlay2Open"
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
            height: 327.6
            color:"transparent"
            radius: 20
            visible: false
            Rectangle{
                width:512
                height: 327.6
                color:"#262626"
                radius: 20
                anchors.centerIn: parent
                OpCard{
                    width: 512
                    height: 325.6
                    title: "History"
                    buttonSource: "../assets/Minimize.png"
                    buttonClickColor: "#b36705"
                    buttonHeight: 42
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
            spacing: 20
            Grid{
                columns: 4
                spacing: 20
                Rectangle{
                    radius: 20
                    width: 116
                    height: 155.6
                    Card{
                        id: waferStage
                        title: "Wafer Stage"
                        status: "Open"
                        onPressed: parent.color="orange"
                        onReleased: parent.color="transparent"
                    }
                    color: "transparent"
                }
                Rectangle{
                    radius: 20
                    width: 116
                    height: 155.6
                    enabled: false
                    Card{
                        id: waferClamp
                        title: "Wafer Clamp"
                        status: "Off"
                        onPressed: parent.color="orange"
                        onReleased: parent.color="transparent"
                    }
                    color: "transparent"
                    opacity: enabled === false ? 0.5 : 1
                }
                Rectangle{
                    radius: 20
                    width: 116
                    height: 155.6
                    Card{
                        id: waferMaskGap
                        title: "Wafer Mask Gap"
                        status: "2.8μm"
                        onPressed: parent.color="orange"
                        onReleased: parent.color="transparent"
                    }
                    enabled: false
                    opacity: enabled === false ? 0.5 : 1
                    color: "transparent"
                }
                Rectangle{
                    radius: 20
                    width: 116
                    height: 155.6
                    Card{
                        id: vibration
                        title: "Vibration"
                        status: "Ok"
                        onPressed: parent.color="orange"
                        onReleased: parent.color="transparent"
                    }
                    color: "transparent"
                }
            }
            Grid{
                columns: 3
                spacing: 20
                Rectangle{
                    id:lightIntensity
                    radius: 20
                    width: 116
                    height: 155.6
                    Card{
                        title: "Light Intensity"
                        status: intensitySlider.value.toPrecision(3) + "%"
                        info: "321 mJ/cm2"
                        onClicked: {
                            if(lightIntensity.state===""){
                                lightIntensity.state="active1"
                                if(duration.state==="active2"){
                                    duration.state=""
                                }
                            }
                            else
                                lightIntensity.state=""
                        }
                    }
                    states: State {
                        name: "active1"
                        PropertyChanges {
                            target: lightIntensity
                            color: "#f5a262"
                        }
                        PropertyChanges {
                            target: slider1
                            visible: true
                        }
                    }
                    color: "transparent"
                }
                Rectangle{
                    id: duration
                    radius: 20
                    width: 116
                    height: 155.6
                    Card{
                        function minutes(t){
                            var totalTime=parseInt(t);
                            var minutes=parseInt(totalTime/60);
                            var seconds=totalTime%60;
                            return (minutes!==0)?minutes+"m "+seconds+"s":seconds+"s";
                        }
                        title: "Duration"
                        status: durationSlider.value + "s"
                        info: minutes(durationSlider.value)
                        onClicked: {
                            if(duration.state===""){
                                duration.state="active2"
                                if(lightIntensity.state==="active1"){
                                    lightIntensity.state=""
                                }
                            }
                            else
                                duration.state=""
                        }
                    }
                    states: State {
                        name: "active2"
                        PropertyChanges {
                            target: duration
                            color: "#f5a262"
                        }
                        PropertyChanges {
                            target: slider2
                            visible: true
                        }
                    }
                    color: "transparent"
                }
                Rectangle{
                    id:history
                    width:239
                    height: 155.6
                    color:"transparent"
                    radius: 20
                    OpCard{
                        x:5
                        y:5
                        width: 239
                        height: 145.6
                        title: "History"
                        buttonSource: "../assets/Expand.png"
                        buttonHeight: 42
                        buttonClickColor: "#b36705"
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
            id: progressPlay
            width:234
            height: 70.8
            color:"transparent"
            radius: 20
            clip: true
            layer.enabled: true
            layer.effect: DropShadow{
                transparentBorder: true
                verticalOffset: 5
                color: "#636363"
                radius: 30
                samples: 61
                spread: 0
            }
            RunCard{
                width: 234
                height: 62.8
                titleFontSize: 24
                buttonWidth: 82
                iconWidth: 36
                progressHeight: 8
                function minutes(t){
                    var totalTime=parseInt(t);
                    var minutes=parseInt(totalTime/60);
                    var seconds=totalTime%60;
                    return (minutes!==0)?minutes+"m "+seconds+"s":seconds+"s";
                }
                function dataEntry(Message,Type){
                    var data="";
                    data += Message+";";
                    data += Qt.formatTime(new Date(),"hh:mm:ss")+";";
                    data += Type+";";
                    data += waferStage.status+";";
                    data += waferClamp.status+";";
                    data += waferMaskGap.status+";";
                    data += vibration.status+";";
                    data += minutes(durationSlider.value)+";";
                    data += intensitySlider.value.toPrecision(3)+"%";

                    historyTable.addRow(-1,data)
                }

                onStart: {
//                    historyTable.removeRow(0)
                    dataEntry("Exposure initiated for "+minutes(durationSlider.value),"Initiated")
                }
                onCompleted: {
                    dataEntry("Exposure Completed","Completed")
                }
                onStop: {
                    dataEntry("Exposure Aborted","Aborted")
                }
            }
        }
        Rectangle{
            id: slider1
            width: 518
            height: 62.8
            color: "#262626"
            radius: 15
            visible: false
            CustomSlider{
                id: intensitySlider
                width: 508
                height: 60.8
                anchors.centerIn: parent
                from: 0; to: 100;stepSize: 0.1
            }
        }
        Rectangle{
            id: slider2
            width: 518
            height: 62.8
            color: "#262626"
            radius: 15
            visible: false
            CustomSlider{
                id: durationSlider
                width: 508
                height: 60.8
                anchors.centerIn: parent
                from: 0; to: 180;stepSize: 1
            }
        }
    }
    Rectangle{
        id:maintainanceMode
        width: 850
        height: 480
        visible: false
        LinearGradient{
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(maintainanceMode.width, maintainanceMode.height)
            gradient: Gradient{
                GradientStop{
                    position: 0
                    color: "#EAEAEA"
                }
                GradientStop{
                    position: 0.5
                    color: "#D6D6DA"
                }
                GradientStop{
                    position: 1
                    color: "#68657E"
                }
            }
        }
        MaintainanceCard{
            anchors.centerIn: parent
            layer.enabled: true
            layer.effect: DropShadow{
                transparentBorder: true
                verticalOffset: 0
                color: "#000000"
                radius: 60
                samples: 121
            }
            iconMode: "Eject"
            titleText: "Awaiting Ejection of the Light Engine"
            descriptionText: "Remove the light engine module continue the module swapping process.

Click cancel to cancel the eject process. Click ejected to confirm that the module has been removed by you."
            successVisible: true
            successText: "Ejected"
            cancelVisible: true
        }
    }
}
