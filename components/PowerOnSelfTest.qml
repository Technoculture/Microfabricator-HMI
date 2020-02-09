import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../vendor"

Item {
    property bool calliberationDone: false
    property int testCaseIndex: 0

    FontAwesome { id: icons; resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf" }

    onCalliberationDoneChanged: {
        sensorController.mode = "VIBRATION_SENSOR"
    }

    Timer {
        interval: 100
        running: true; repeat: true

        onTriggered: {
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

    Rectangle {
        id: baseRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 120
        anchors.horizontalCenterOffset: 12
        width: testsColumn.width + 20; height: testsColumn.height + 20
        color: Qt.rgba(0,0,0,0.0)

        ColumnLayout {
            id: testsColumn
            anchors.centerIn: parent

            Rectangle {
                id: textlabelrect
                Layout.alignment: Qt.AlignLeft//Center
                Layout.leftMargin: 95
                width: parent.width
                height: 30
                color: "black"

                Text {
                    id: textlabel
                    anchors.centerIn: parent
                    text: "Self Calliberation "
                    color: "darkred"
                    font.pixelSize: 18
                }

                Text {
                    id: iconlabel
                    property int rot_angle: 0.0
                    anchors.verticalCenter: textlabel.verticalCenter
                    anchors.left: textlabel.right
                    font.family: icons.family
                    text: icons.icons.fa_spinner
                    color: "darkred"
                    font.pixelSize: 18
                    opacity: 0.6
                    transform: Rotation { origin.x: iconlabel.width/2; origin.y: iconlabel.height/2; angle: iconlabel.rot_angle}
                    Behavior on rot_angle { NumberAnimation { duration: 1000; easing.type: Easing.Linear} }
                }

                Timer {
                    id: spinnerTimer
                    interval: 1000
                    running: true; repeat: true
                    onTriggered: { iconlabel.rot_angle = (iconlabel.rot_angle + 45) }
                }
            }

            Repeater {
                model: 3
                Layout.alignment: Qt.AlignLeft
                Rectangle {
                    id: labelrect
                    Layout.alignment: Qt.AlignLeft
                    width: testTextRow.width* 1.2
                    height: testTextRow.height * 1.5
                    color: Qt.rgba(0,0,0,0.4)
                    radius: height / 2

                    RowLayout {
                        id: testTextRow
                        property color textColor: calliberationModel.get(index).status === "ok" ? "lightgreen" : "lightred"
                        anchors.verticalCenter: labelrect.verticalCenter
                        spacing: 10

                        Text {
                            id: labelStatus
                            font.pixelSize: 18
                            font.family: icons.family
                            color: testTextRow.textColor
                            text: { (calliberationModel.get(index).status === "ok" ? (icons.icons.fa_check_circle + " ") : (icons.icons.fa_exclamation_triangle + " ")) }
                            Layout.leftMargin: 10
                        }
                        Text {
                            id: label
                            color: testTextRow.textColor
                            font.pixelSize: 16
                            text: { String(calliberationModel.get(index).name) }
                        }
                    }
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
