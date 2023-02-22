import QtQuick 2.15
import QtGraphicalEffects 1.15
import "../assets"

Item {
    id:root
    property alias title: heading.text
    property int titleFontSize: 18
    signal clicked()
    signal start()
    signal completed()
    signal stop()
    property double iconWidth: 26

    property double buttonWidth: 0
    property double buttonHeight: 0
    property color buttonClickColor: "black"
    property int progressHeight: 0
    property double percent: 0
    property int durationValue: durationSlider.value
    Rectangle{
        id: cardArea
        anchors.fill: parent
        color: "#232323"
        radius: 20
        clip: true
        Rectangle{
            id: progressBar
            color: "transparent"
            width: parent.width
            height: progressHeight
            clip: true
            visible: false
            radius: 20
            Rectangle {
                id: clipped1
                width: progressBar.width
                height: 200
                radius: 20
                color: "#6e5e4b"
                clip: true
                anchors.bottom: parent.bottom
                Rectangle {
                    id: progress
                    width: percent * progressBar.width
                    height: 200
                    color: "transparent"
                    clip: true
                    radius: 20
                    Rectangle {
                        id: clipped2
                        width: progressBar.width
                        height: 30
                        radius: 30
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
        Text {
            id: heading
            color: "white"
            function minute(t){
                var min="0",sec="0"
                var totalTime=parseInt(t);
                var minutes=parseInt(totalTime/60);
                var seconds=totalTime%60;
                min+=minutes;sec=(seconds<10)?"0"+seconds:seconds;
                return [min,sec];
            }
            text: "00:"+minute(durationValue)[0]+":"+minute(durationValue)[1]
            x: 19
            font.pixelSize: titleFontSize
            wrapMode: Text.WordWrap
            anchors.verticalCenter: parent.verticalCenter
        }
        Button{
            id: runButton
            radius: 20
            y: 2
            backgroundColor: "#232323"
            iconImage: runButton.state !== 'running' ? "../assets/Play-Run.png" : "../assets/Stop.png"
            sidePadding: 20
            height: buttonHeight !== 0? buttonHeight : implicitHeight
            width: buttonWidth !== 0 ? buttonWidth : implicitWidth
            //if not given explicitly then we give default height and width
            anchors.right: parent.right
            Timer{
                interval: 1000
                running: true; repeat: true
                onTriggered: {
                    if(percent<1 && runButton.state==='running'){
                        percent+=1/(durationSlider.value);
                        durationValue-=1;
                    }
                    else{
                        if(percent>=1)
                            completed()
                        percent=0;
                        progressBar.visible=false;
                        runButton.state=''
                    }
                }
            }

            onClicked: {
                if(runButton.state === ''){
                    runButton.state = 'running'
                    start()
                }
                else{
                    runButton.state = ''
                    if(durationSlider.value!==0)
                        stop()
                }
            }
            // this will expand the history panel and minimize it
            states: [
                State {
                    name: "running"
                    PropertyChanges {target: progressBar; visible:true}
                }
            ]
            iconSize: iconWidth !== 0 ? iconWidth : 28 //if explicit width given then that width is assigned or else default 28 value is given
            onPressed: backgroundColor = buttonClickColor
            onReleased: backgroundColor = "transparent"
        }
    }
}
