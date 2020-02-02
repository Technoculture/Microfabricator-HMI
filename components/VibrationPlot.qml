import QtQuick 2.0
import QtCharts 2.0

Item {
    property color lineColor: Qt.rgba(0,0,0);
    anchors.fill: parent
    Text {
        text: sensorController.serialData
    }
    Canvas {
        width: 800; height: 200
        contextType: "2d"

        Path {
            id: myPath
            startX: 0; startY: 100

            PathCurve { x: 5; y: 25 }
            PathCurve { x: 25; y: 105 }
            PathCurve { x: 55; y: 45 }
            PathCurve { x: 65; y: 95 }
            PathCurve { x: 75; y: 75 }
        }

        onPaint: {
            context.strokeStyle = lineColor
            //context.strokeStyle = Qt.rgba(1,1,1);
            context.path = myPath;
            context.stroke();
        }
    }
}
