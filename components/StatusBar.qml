import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    // PUBLIC INTERFACE
    signal startExposure
    signal pauseExposure
    signal goHome

    readonly property alias statusHeight: baseRect.height

    // PRIVATE
    id: _root
    property alias _color: baseRect.color
    property alias _text: statusText.text
    property alias _text_color: statusText.color
    // =============================================================================================


    // INITIALIZATION
    state: { allChecksDone ? "readyToExpose" : "waitingForChecks" }
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
            console.log("STATUS CLICKED")
            console.log(_root.state)
            if(state === "waitingForChecks") {}
            else if(_root.state === "readyToExpose") {
                startExposure()
                uvController.intensity = pwmIntensity
                _root.state = "pauseExposure"
            }
            else if(_root.state === "pauseExposure") {
                exposureTimer.stop()
                uvController.intensity = 0
                _root.state = "resumeExposure"
            }
            else if(_root.state === "resumeExposure") {
                exposureTimer.start()
                uvController.intensity = pwmIntensity
                _root.state = "pauseExposure"
            }
            else if(_root.state === "exposureComplete") {
                uvController.intensity = 0
                goHome()
//                _root.state = "waitingForChecks"
                _root.state = Qt.binding(function(){ if(allChecksDone){return "readyToExpose"} else{return "waitingForChecks"} })
            }
//            else if(_root.state === "openTray") {
//                sliderController.state = "MOVE_OUTWARDS"
//                _root.state = "closeTray"
//            }
//            else if(_root.state === "closeTray") {
//                sliderController.state = "MOVE_INWARDS"
//                _root.state = "waitingForChecks"
//            }
        }
    }

    // STATE
    states: [
        State { name: "waitingForChecks";
            PropertyChanges { target: _root; _color: style.black; _text_color: style.white; _text: "Waiting for checks" } },
        State { name: "readyToExpose";
            PropertyChanges { target: _root; _color: style.green; _text: "Press to Initiate Exposure" } },
        State { name: "pauseExposure";
            PropertyChanges { target: _root; _color: style.yellow; _text_color: style.black; _text: "Pause the Exposure" } },
        State { name: "resumeExposure";
            PropertyChanges { target: _root; _color: style.green; _text: "Resume the Exposure" } },
        State { name: "exposureComplete";
            PropertyChanges { target: _root; _color: style.green; _text: "Exposure is Complete" } }
    ]
    // =============================================================================================

    transitions: [
        Transition { ColorAnimation { duration: 500; easing.type: Easing.OutElastic }}
    ]
}
