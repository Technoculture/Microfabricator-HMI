import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"

Item {
    // PUBLIC INTERFACE
    signal expose
    signal exposureComplete
    signal openTray

    readonly property alias statusHeight: baseRect.height
    property alias state: _root.state

    // PRIVATE
    id: _root
    property alias _color: baseRect.color
    property alias _text: statusText.text
    property alias _text_color: statusText.color
    // =============================================================================================


    // INITIALIZATION
    state: allChecksDone ? "readyToExpose" : "waitingForChecks"
    UIStyle { id: style }

    // COMPONENTS
    Rectangle {
        id: baseRect
        height: 42; width: 644
        anchors.centerIn: parent
        border.color: style.black
        border.width: 1
    }

    Text {
        id: statusText
        anchors.centerIn: baseRect
        font { pixelSize: 18; family: "Helvetica" }
    }
    // =============================================================================================

    CheckBox {
        id: fan
        text: "Fan"
        checked: true
        anchors.right: baseRect.left
        anchors.verticalCenter: baseRect.verticalCenter
        onCheckStateChanged: { uvController.fanState = checked }
    }
    CheckBox {
        id: sensormode
        tristate: true
        checked: true
        text: "Vibration"
        anchors.left: fan.left
        anchors.bottom: fan.top
        onCheckStateChanged: {
            if(checkState == Qt.Unchecked){
                sensormode.text = "Temperature"
                sensorController.mode = "TEMPERATURE_SENSOR"
            } else if(checkState == Qt.PartiallyChecked) {
                sensormode.text = "UV Intensity"
                sensorController.mode = "LIGHT_SENSOR"
            } else if(checkState == Qt.Checked){
                sensormode.text = "Vibration"
                sensorController.mode = "VIBRATION_SENSOR"
            }
        }
    }

    // INTERACTIONS
    property int _stateIndex: 0
    MouseArea {
        anchors.fill: baseRect
        onClicked: {
            if(state === "waitingForChecks") {}
            else if(state === "readyToExpose") {}
            else if(state === "pauseExposure") {}
            else if(state === "openTray") {}
            else if(state === "closeTray") {}
        }
    }

    // STATE
    states: [
        State { name: "waitingForChecks";
            PropertyChanges { target: _root; _color: style.black; _text_color: style.white; _text: "Waiting for checks" } },
        State { name: "readyToExpose";
            PropertyChanges { target: _root; _color: style.green; _text: "Ready to expose" } },
        State { name: "pauseExposure";
            PropertyChanges { target: _root; _color: style.black; _text_color: style.white; _text: "Pause the exposure" } },
        State { name: "openTray";
			PropertyChanges { target: _root; _color: style.green;  _text: "Open Tray" } },
        State { name: "closeTray";
			PropertyChanges { target: _root; _color: style.green;  _text: "Close Tray" } }
    ]
    // =============================================================================================

    transitions: [
        Transition { ColorAnimation { duration: 500; easing.type: Easing.InOutElastic }}
    ]
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
