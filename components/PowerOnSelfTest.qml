import QtQuick 2.0
import QtQuick.Layouts 1.12

Item {
    property bool calliberationDone: false
    property int testCaseIndex: 0

    onCalliberationDoneChanged: {
        sensorController.mode = "VIBRATION_SENSOR"
    }

    Timer {
        interval: 1000
        running: true; repeat: true

        onTriggered: {
//            console.log(testCaseIndex)
            if(testCaseIndex < 3) {
                if(testCaseIndex > 0) {
                    getLightReading(testCaseIndex-1)
                    setLightForReading(testCaseIndex)
                }
                else if(testCaseIndex === 0) { setLightForReading(testCaseIndex) }
                testCaseIndex++
            }
            else if(testCaseIndex === 3) { getLightReading(testCaseIndex-1); testCaseIndex++ }
            else {
                running = false
                calliberationDone = true
            }
        }
    }

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 100

        Rectangle {
            id: textlabelrect
            Layout.alignment: Qt.AlignCenter
            width: textlabel.width* 1.3
            height: textlabel.height * 1.3
            color: "black"
            radius: height / 2

            Text {
                id: textlabel
                anchors.centerIn: parent
                text: "Conducting Self Tests"
                color: "white"
                font.pixelSize: 18
            }
        }

        Repeater {
            model: 3
            Rectangle {
                id: labelrect
                Layout.alignment: Qt.AlignCenter
                width: label.width* 1.3
                height: label.height * 1.3
                color:  calliberationModel.get(index).status === "ok" ? "green" : "yellow"
                radius: height / 2

                Text {
                    id: label
                    anchors.centerIn: parent
                    color: calliberationModel.get(index).status === "ok" ? "white" : "black"
                    font.pixelSize: 16
                    text: { (calliberationModel.get(index).status === "ok" ? "\u2714 "
                                                                           : "\u26A0 "
                             ) +
                            String(calliberationModel.get(index).name) }
                }
            }
        }
    }

    function setLightForReading(i) {
        uvController.intensity = calliberationModel.get(i).intensity
        sensorController.mode = "LIGHT_SENSOR"
    }

    function getLightReading(i) {
        calliberationModel.set(i, {value: 10})//parseInt(sensorController.serialData)})
        // TODO: Check if the value is acceptable
        calliberationModel.set(i, {status: "ok"})
    }

    ListModel {
        id: calliberationModel
        ListElement { name: "Minimum Intensity"; status: "pending"; value: 0.0; intensity: 10 }
        ListElement { name: "Median Intensity"; status: "pending"; value: 0.0; intensity: 50 }
        ListElement { name: "Maximum Intensity"; status: "pending"; value: 0.0; intensity: 90 }
    }
}
