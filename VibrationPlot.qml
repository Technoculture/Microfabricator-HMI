import QtQuick 2.0
import QtCharts 2.0

Item {
    anchors.fill: parent
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
            PathCurve { x: 85; y: 23 }
            PathCurve { x: 95; y: 90 }
            PathCurve { x: 105; y: 56 }
            PathCurve { x: 115; y: 75 }
            PathCurve { x: 125; y: 15 }
            PathCurve { x: 135; y: 175 }
            PathCurve { x: 145; y: 65 }
            PathCurve { x: 165; y: 25 }
            PathCurve { x: 175; y: 65 }
            PathCurve { x: 185; y: 15 }
            PathCurve { x: 200; y: 50 }
            PathCurve { x: 210; y: 10 }
            PathCurve { x: 220; y: 150 }
            PathCurve { x: 230; y: 100 }
            PathCurve { x: 240; y: 30 }
            PathCurve { x: 250; y: 50 }
            PathCurve { x: 270; y: 140 }
            PathCurve { x: 280; y: 110 }
            PathCurve { x: 305; y: 25 }
            PathCurve { x: 325; y: 55 }
            PathCurve { x: 335; y: 65 }
            PathCurve { x: 345; y: 105 }
            PathCurve { x: 355; y: 25 }
            PathCurve { x: 365; y: 34 }
            PathCurve { x: 375; y: 45 }
            PathCurve { x: 390; y: 90 }
            PathCurve { x: 420; y: 100 }
            PathCurve { x: 430; y: 50 }
            PathCurve { x: 440; y: 130 }
            PathCurve { x: 450; y: 80 }
            PathCurve { x: 460; y: 10 }
            PathCurve { x: 470; y: 90 }
            PathCurve { x: 480; y: 100 }
            PathCurve { x: 490; y: 10 }
            PathCurve { x: 500; y: 50 }
            PathCurve { x: 510; y: 120 }
            PathCurve { x: 520; y: 40 }
            PathCurve { x: 530; y: 150 }
            PathCurve { x: 540; y: 110 }
            PathCurve { x: 550; y: 20 }
            PathCurve { x: 560; y: 70 }
            PathCurve { x: 570; y: 50 }
            PathCurve { x: 580; y: 150 }
            PathCurve { x: 615; y: 25 }
            PathCurve { x: 625; y: 25 }
            PathCurve { x: 635; y: 25 }
            PathCurve { x: 645; y: 25 }
            PathCurve { x: 665; y: 125 }
            PathCurve { x: 675; y: 25 }
            PathCurve { x: 685; y: 2 }
            PathCurve { x: 695; y: 125 }
            PathCurve { x: 700; y: 10 }
            PathCurve { x: 710; y: 130 }
            PathCurve { x: 720; y: 100 }
            PathCurve { x: 730; y: 90 }
            PathCurve { x: 740; y: 50 }
            PathCurve { x: 750; y: 140 }
            PathCurve { x: 760; y: 3 }
            PathCurve { x: 770; y: 90 }
            PathCurve { x: 790; y: 10 }
            PathCurve { x: 800; y: 150 }
        }

        onPaint: {
            context.strokeStyle = Qt.rgba(0,0,0);
            //context.strokeStyle = Qt.rgba(1,1,1);
            context.path = myPath;
            context.stroke();
        }
    }
}
