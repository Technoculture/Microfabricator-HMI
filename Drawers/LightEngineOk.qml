import QtQuick 2.0
import QtQuick.Controls 2.12
import QtCharts 2.3
import "../"

Item {
    id: _root
    property color bgColor: style.black
    property color textColor_Values: style.green
    property color textColor_Titles: "gainsboro"
    property int fontSize_Values: 14
    property int fontSize_Titles: 11

    Rectangle {
        id: baseRect
        anchors.fill: _root
        color: bgColor
    }

    UIStyle { id: style }

    SwipeView {
        id: view
        anchors.fill: baseRect
        interactive: true
        currentIndex: 0
        clip: true

        Item {
            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 18

                Text {
                    text: "\u2714"
                    color: textColor_Values
                    font.pointSize: 40
                    anchors.horizontalCenter: parent.horizontalCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log(globalCurrentIndex)
                            console.log(checksModel.get(globalCurrentIndex).status)
                            checksModel.set(globalCurrentIndex, {"status" : "ok"})
                            console.log(checksModel.get(globalCurrentIndex).status)
                        }
                    }
                }

                Row {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 15
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\u2713"
                        color: textColor_Values
                        font.pointSize: fontSize_Values
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Critical\u0394"
                        color: textColor_Titles
                        font.pointSize: fontSize_Titles
                    }
                    Text {
                        text: "-2%"
                        color: textColor_Values
                        font.pointSize: fontSize_Values
                    }
                }
                Row {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 15
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\u2713"
                        color: textColor_Values
                        font.pointSize: fontSize_Values
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Subcritical\u0394"
                        color: textColor_Titles
                        font.pointSize: fontSize_Titles
                    }
                    Text {
                        text: "+1%"
                        color: textColor_Values
                        font.pointSize: fontSize_Values
                    }
                }

                Row {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 15
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\u2713"
                        color: textColor_Values
                        font.pointSize: fontSize_Values
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Dominant\u0394"
                        color: textColor_Titles
                        font.pointSize: fontSize_Titles
                    }
                    Text {
                        text: "-1%"
                        color: textColor_Values
                        font.pointSize: fontSize_Values
                    }
                }
            }
        }
        Item {
            Canvas {
                anchors.fill: parent
                contextType: "2d"
                Path {
                    id: myPath2
                    startX: 30; startY: 90

                    PathCurve { x: 30; y: 100 }
                    PathCurve { x: 50; y: 120 }
                    PathCurve { x: 70; y: 129 }
                    PathCurve { x: 90; y: 100 }
                    PathCurve { x: 110; y: 115 }
                    PathCurve { x: 130; y: 90 }
                    PathCurve { x: 150; y: 120 }
                    PathCurve { x: 170; y: 100 }
                }

                onPaint: {
                    context.strokeStyle = Qt.rgba(1,1,1);
                    context.path = myPath2;
                    context.stroke();
                }
            }
        }
    }
    PageIndicator {
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
