import QtQuick 2.15
import QtGraphicalEffects 1.15
import "../assets"

Item {
    id:root
    property alias title: heading.text
    property int titleFontSize: 18
    signal clicked()
    property double iconWidth: 26

    property string buttonSource: ""
    property double buttonWidth: 0
    property double buttonHeight: 0
    property color buttonClickColor: "black"
    Rectangle{
        id: cardArea
        anchors.fill: parent
        color: "#232323"
        radius: 20
        clip: true
        x: !cards.visible ? 0 : 5
        y: !cards.visible ? 0 : 5
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
            onClicked: {
                if(expandButton.state === ''){
                    expandButton.state = 's1'
                }
                else if(expandButton.state === 's2'){
                    expandButton.state = 's1'
                }
                else{
                    expandButton.state = 's2'
                }
            }
            // this will expand the history panel and minimize it
            states: [
                State {
                    name: "s1"
                    PropertyChanges {target: historyFull; visible:true}
                    PropertyChanges {target: cards; visible:false}
                },
                State {
                    name: "s2"
                    PropertyChanges {target: historyFull; visible:false}
                    PropertyChanges {target: cards; visible:true}
                }
            ]
            iconSize: iconWidth !== 0 ? iconWidth : 28 //if explicit width given then that width is assigned or else default 28 value is given
            onPressed: backgroundColor = buttonClickColor
            onReleased: backgroundColor = "transparent"
        }
        Rectangle{
            id: historyList
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
            ListView{
                anchors.leftMargin: 10
                anchors.topMargin: 6
                anchors.fill: parent
                model: historyTable
                delegate: HistoryItem{
                    width: parent.width
                    time: Qt.formatTime(new Date(),"hh:mm")
                    message: model.message
                    action: model.type==="Initiated"?"Abort":"Redo"
                }
            }
            anchors.bottom: parent.bottom
        }
    }
}
