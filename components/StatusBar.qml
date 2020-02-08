import QtQuick 2.0
import QtQuick.Controls 2.12
import "../"
import "../vendor"

Item {
    // PUBLIC INTERFACE
    signal startExposure
    signal pauseExposure
    signal goHome
    signal shutDown

    readonly property alias statusHeight: baseRect.height

    // PRIVATE
    id: _root
    property alias _color: baseRect.color
    property string _text: ""
    property string _icon: ""
    property alias _text_color: statusText.color
    // =============================================================================================


    // INITIALIZATION
    state: { allChecksDone ? "readyToExpose" : "waitingForChecks" }

    FontAwesome { id: icons; resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf" }

    // COMPONENTS
    Rectangle {
        id: baseRect
        height: 42; width: 644
        anchors.centerIn: parent
        border.color: Style.black
        border.width: 1
    }

    Text {
        id: statusText
        anchors.centerIn: baseRect
        font { pixelSize: 18; family: icons.family }
        text: /*_icon + " " +*/ _text
    }
    // =============================================================================================

    Rectangle {
        id: powerRect
        anchors.right: baseRect.left
        anchors.top: baseRect.top
        width: baseRect.height; height: baseRect.height
        color: Qt.rgba(0,0,0,0.5)
        Text {
            anchors.centerIn: parent
            font.family: icons.family
            text: icons.icons.fa_power_off
            color: Style.white
        }
    }
    MouseArea {
        id: powerRectMArea
        anchors.fill: powerRect
        onContainsMouseChanged: {
            if(powerRectMArea.containsMouse){ powerRect.opacity = 0.5 }
            else { powerRect.opacity = 1 }
        }
    }

//    CheckBox {
//        id: fan
//        text: "Fan"
//        checked: true
//        anchors.right: baseRect.left
//        anchors.verticalCenter: baseRect.verticalCenter
//        onCheckStateChanged: { uvController.fanState = checked }
//    }
//    CheckBox {
//        id: sensormode
//        tristate: true
//        checked: true
//        text: "Vibration"
//        anchors { left: fan.left; bottom: fan.top }
//        onCheckStateChanged: {
//            if(checkState == Qt.Unchecked){
//                sensormode.text = "Temperature"
//                sensorController.mode = "TEMPERATURE_SENSOR"
//            } else if(checkState == Qt.PartiallyChecked) {
//                sensormode.text = "UV Intensity"
//                sensorController.mode = "LIGHT_SENSOR"
//            } else if(checkState == Qt.Checked){
//                sensormode.text = "Vibration"
//                sensorController.mode = "VIBRATION_SENSOR"
//            }
//        }
//    }

    // INTERACTIONS
    property int _stateIndex: 0
    MouseArea {
        anchors.fill: baseRect
        onClicked: {
            console.log("STATUS CLICKED")
            console.log(_root.state)
            if(_root.state === "waitingForChecks") {}
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
            PropertyChanges { target: _root; _color: Style.black; _text_color: Style.white; _text: " Waiting for checks"; _icon: icons.icons.fa_bars; } },
        State { name: "readyToExpose";
            PropertyChanges { target: _root; _color: Style.green; _text: "Press to Initiate Exposure"; _icon: icons.icons.fa_play } },
        State { name: "pauseExposure";
            PropertyChanges { target: _root; _color: Style.yellow; _text_color: Style.black; _text: "Pause the Exposure"; _icon: icons.icons.fa_pause } },
        State { name: "resumeExposure";
            PropertyChanges { target: _root; _color: Style.green; _text: "Resume the Exposure"; _icon: icons.icons.fa_play } },
        State { name: "exposureComplete";
            PropertyChanges { target: _root; _color: Style.green; _text: "Exposure is Complete"; _icon: icons.icons.fa_check } }
    ]
    // =============================================================================================

    transitions: [
        Transition { ColorAnimation { duration: 500; easing.type: Easing.OutElastic }}
    ]
}
