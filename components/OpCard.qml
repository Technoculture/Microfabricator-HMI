import QtQuick 2.15
import QtGraphicalEffects 1.12
import "../assets"

Item {
    id:root
    property alias title: heading.text
    property int titleFontSize: 18

    property double iconWidth: 26

    property string buttonSource: ""
    property double buttonWidth: 0
    property double buttonHeight: 0
    property color buttonClickColor: "black"

    property int historyLogHeight1: 18
    property int historyLogHeight2: 18
    property int historyLogHeight4: 18
    property int historyLogHeight6: 18

    property int progressHeight: 0
    property int bodyWidth: 0
    property double progressOpacity: 1
    property double historyOpacity: 0
    Rectangle{
        id: cardArea
        width: parent.width
        height: parent.height
        color: "#232323"
        radius: 20
        clip: true
        x: (historyOpacity === 0 || !cards.visible) ? 0 : 5
        y: historyOpacity === 0 ? 0 : 5
        //special indentation if history is expanded
        Text {
            id: heading
            color: "white"
            x: 19
            y: 10
            font.pixelSize: titleFontSize
            wrapMode: Text.WordWrap
        }
        Button{
            id: expandButton
            radius: 20
            backgroundColor: "#232323"
            iconImage: buttonSource
            sidePadding: 20
            height: buttonHeight !== 0? buttonHeight : implicitHeight
            width: buttonWidth !== 0 ? buttonWidth : implicitWidth
            //if not given explicitly then we give default height and width
            anchors.right: parent.right
            onClicked: expandButton.state === '' ? expandButton.state = 's1' : expandButton.state = ''
            // this will expand the history panel and minimize it
            states: State {
                name: "s1"
                PropertyChanges {target: historyFull; visible:true}
                PropertyChanges {target: cards; visible:false}
            }
            iconSize: iconWidth !== 0 ? iconWidth : 28 //if explicit width given then that width is assigned or else default 28 value is given
            onPressed: backgroundColor = buttonClickColor
            onReleased: backgroundColor = "transparent"
        }
        Rectangle{
            id: progressBar
            color: "transparent"
            width: parent.width
            height: progressHeight
            clip: true
            opacity: progressOpacity
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
                    width: 0.3 * progressBar.width
                    height: 200
                    color: "transparent"
                    clip: true
                    Rectangle {
                        id: clipped2
                        width: progressBar.width
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
            id: historyList
            opacity: historyOpacity
            width: parent.width
            height: parent.height - expandButton.height
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
                    HistoryItem{
                        time: "23:56"
                        message: "Light Engine Auto-calliberation"
                        height: historyLogHeight1
                    }
                    HistoryItem{
                        time: "23:56"
                        message: "Exposure initiated for 2m 30s at 321mJ/cm2 (21%)"
                        height: historyLogHeight2
                    }
                    HistoryItem{
                        time: "23:56"
                        message: "Exposure complete "
                        action: "Redo"
                        actionColor: "green"
                    }
                    HistoryItem{
                        time: "23:56"
                        message: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)"
                        height: historyLogHeight4
                    }
                    HistoryItem{
                        time: "23:56"
                        message: "Exposure complete "
                        action: "Redo"
                        actionColor: "green"
                    }
                    HistoryItem{
                        time: "23:56"
                        message: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)"
                        height: historyLogHeight6
                    }
                    HistoryItem{
                        time: "23:56"
                        message: "Exposure Paused after 32s of exposure "
                        action: "Resume"
                        actionColor: "#5f849c"
                    }
                }
            }
            anchors.bottom: parent.bottom
        }
    }
}
