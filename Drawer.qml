import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    property int currentIndex: 0
    property alias state: baseRect.state

    UIStyle { id: style }

    Rectangle {
        id: baseRect
        height: 290; width: 230
        y: 95-84;
        color: style.grey
        state: 'closed'

        Text {
            anchors.centerIn: parent
            color: style.black
            font { pointSize: 30 }
            text: currentIndex
        }

        Slider {
            id: slider
            x: 15
            y: 74
            value: 0.5
        }

        Button {
            id: button
            x: 65
            y: 193
            text: qsTr("Button")
        }

        CheckBox {
            id: checkBox
            x: 62
            y: 34
            text: qsTr("Check Box")
        }



        states: [
            State { name: "open";   PropertyChanges { target: baseRect; x: 522-267 } },
            State { name: "closed"; PropertyChanges { target: baseRect; x: 305-267 } }
        ]
    }

//    MouseArea {
//        anchors.fill: baseRect
//        onClicked: { baseRect.state == 'open' ? baseRect.state = 'closed' : baseRect.state = 'open'; }
//    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
