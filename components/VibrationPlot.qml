import QtQuick 2.0
import QtCharts 2.0

Item {
    id: _root
    property color lineColor: Qt.rgba(0,0,0,0.3);
    property bool inDrawer: false
    clip: true

//    Text {
//        text: sensorController.serialData
//    }
    ChartView {
        anchors.fill: parent
        legend.visible: false
        antialiasing: true
        anchors { fill: parent; margins: -50 }
        margins { right: 0; bottom: 0; left: 0; top: 0 }
        plotAreaColor: _root.inDrawer ? "black" : /*allChecksDone ? "green" :*/ "white";

        SplineSeries {
            id: vibrLine
            color: _root.inDrawer ? Qt.rgba(1,1,1,1) : Qt.rgba(0,0,0,0.5)
            width: 1

            axisX: ValueAxis { labelsVisible: false; gridVisible: false; lineVisible: false }
            axisY: ValueAxis { labelsVisible: false; gridVisible: false; lineVisible: false;
                min: 3;
                max: _root.inDrawer ? 6 : 10;
            }

//            Component.onCompleted: {
//                for(let i =0; i<=100; i++){
//                    vibrLine.append(i, Math.random()*5)
//                }
//                console.log(vibrLine)
//            }

            XYPoint { x: 0; y: 4.3 }
            XYPoint { x: 1; y: 4.1 }
            XYPoint { x: 2; y: 4.7 }
            XYPoint { x: 3; y: 3.9 }
            XYPoint { x: 4; y: 5.2 }
            XYPoint { x: 5; y: 4.1 }
            XYPoint { x: 6; y: 4.7 }
            XYPoint { x: 7; y: 3.9 }
            XYPoint { x: 8; y: 5.2 }
            XYPoint { x: 9; y: 4.1 }
            XYPoint { x: 10; y: 4.7 }
            XYPoint { x: 11; y: 4.1 }
            XYPoint { x: 12; y: 4.7 }
            XYPoint { x: 13; y: 3.9 }
            XYPoint { x: 14; y: 5.2 }
            XYPoint { x: 15; y: 4.1 }
            XYPoint { x: 16; y: 4.7 }
            XYPoint { x: 17; y: 3.9 }
            XYPoint { x: 18; y: 5.2 }
            XYPoint { x: 19; y: 4.1 }
            XYPoint { x: 20; y: 4.7 }
            XYPoint { x: 21; y: 4.1 }
            XYPoint { x: 22; y: 4.7 }
            XYPoint { x: 23; y: 3.9 }
            XYPoint { x: 24; y: 5.2 }
            XYPoint { x: 25; y: 4.1 }
            XYPoint { x: 26; y: 4.7 }
            XYPoint { x: 27; y: 3.9 }
            XYPoint { x: 28; y: 5.2 }
            XYPoint { x: 29; y: 4.1 }
            XYPoint { x: 30; y: 4.7 }
            XYPoint { x: 31; y: 4.1 }
            XYPoint { x: 32; y: 4.7 }
            XYPoint { x: 33; y: 3.9 }
            XYPoint { x: 34; y: 5.2 }
            XYPoint { x: 35; y: 4.1 }
            XYPoint { x: 36; y: 4.7 }
            XYPoint { x: 37; y: 3.9 }
            XYPoint { x: 38; y: 5.2 }
            XYPoint { x: 39; y: 4.1 }
            XYPoint { x: 40; y: 4.3 }
            XYPoint { x: 41; y: 4.1 }
            XYPoint { x: 42; y: 4.7 }
            XYPoint { x: 43; y: 3.9 }
            XYPoint { x: 44; y: 5.2 }
            XYPoint { x: 45; y: 4.1 }
            XYPoint { x: 46; y: 4.7 }
            XYPoint { x: 47; y: 3.9 }
            XYPoint { x: 48; y: 5.2 }
            XYPoint { x: 49; y: 4.1 }
            XYPoint { x: 50; y: 4.3 }
            XYPoint { x: 51; y: 4.1 }
            XYPoint { x: 52; y: 4.7 }
            XYPoint { x: 53; y: 3.9 }
            XYPoint { x: 54; y: 5.2 }
            XYPoint { x: 55; y: 4.1 }
            XYPoint { x: 56; y: 4.7 }
            XYPoint { x: 57; y: 3.9 }
            XYPoint { x: 58; y: 5.2 }
            XYPoint { x: 59; y: 4.1 }
            XYPoint { x: 60; y: 4.3 }
            XYPoint { x: 61; y: 4.1 }
            XYPoint { x: 62; y: 4.7 }
            XYPoint { x: 63; y: 3.9 }
            XYPoint { x: 64; y: 5.2 }
            XYPoint { x: 65; y: 4.1 }
            XYPoint { x: 66; y: 4.7 }
            XYPoint { x: 67; y: 3.9 }
            XYPoint { x: 68; y: 5.2 }
            XYPoint { x: 69; y: 4.1 }
            XYPoint { x: 70; y: 4.3 }
            XYPoint { x: 71; y: 4.1 }
            XYPoint { x: 72; y: 4.7 }
            XYPoint { x: 73; y: 3.9 }
            XYPoint { x: 74; y: 5.2 }
            XYPoint { x: 75; y: 4.1 }
            XYPoint { x: 76; y: 4.7 }
            XYPoint { x: 77; y: 3.9 }
            XYPoint { x: 78; y: 5.2 }
            XYPoint { x: 79; y: 4.1 }
            XYPoint { x: 80; y: 4.3 }
            XYPoint { x: 81; y: 4.1 }
            XYPoint { x: 82; y: 4.7 }
            XYPoint { x: 83; y: 3.9 }
            XYPoint { x: 84; y: 5.2 }
            XYPoint { x: 85; y: 4.1 }
            XYPoint { x: 86; y: 4.7 }
            XYPoint { x: 87; y: 3.9 }
            XYPoint { x: 88; y: 5.2 }
            XYPoint { x: 89; y: 4.1 }
            XYPoint { x: 90; y: 4.3 }
            XYPoint { x: 91; y: 4.1 }
            XYPoint { x: 92; y: 4.7 }
            XYPoint { x: 93; y: 3.9 }
            XYPoint { x: 94; y: 5.2 }
            XYPoint { x: 95; y: 4.1 }
            XYPoint { x: 96; y: 4.7 }
            XYPoint { x: 97; y: 3.9 }
            XYPoint { x: 98; y: 5.2 }
            XYPoint { x: 99; y: 4.1 }
            XYPoint { x: 100; y: 4.3 }
            XYPoint { x: 101; y: 4.1 }
            XYPoint { x: 102; y: 4.7 }
            XYPoint { x: 103; y: 3.9 }
            XYPoint { x: 104; y: 5.2 }
            XYPoint { x: 105; y: 4.1 }
            XYPoint { x: 106; y: 4.7 }
            XYPoint { x: 107; y: 3.9 }
            XYPoint { x: 108; y: 5.2 }
            XYPoint { x: 109; y: 4.1 }
            XYPoint { x: 110; y: 4.3 }
            XYPoint { x: 111; y: 4.1 }
            XYPoint { x: 112; y: 4.7 }
            XYPoint { x: 113; y: 3.9 }
            XYPoint { x: 114; y: 5.2 }
            XYPoint { x: 115; y: 4.1 }
            XYPoint { x: 116; y: 4.7 }
            XYPoint { x: 117; y: 3.9 }
            XYPoint { x: 118; y: 5.2 }
            XYPoint { x: 119; y: 4.1 }
            XYPoint { x: 120; y: 4.3 }
            XYPoint { x: 121; y: 4.1 }
            XYPoint { x: 122; y: 4.7 }
            XYPoint { x: 123; y: 3.9 }
            XYPoint { x: 124; y: 5.2 }
            XYPoint { x: 125; y: 4.1 }
            XYPoint { x: 126; y: 4.7 }
            XYPoint { x: 127; y: 3.9 }
            XYPoint { x: 128; y: 5.2 }
            XYPoint { x: 129; y: 4.1 }
            XYPoint { x: 130; y: 4.3 }
            XYPoint { x: 131; y: 4.1 }
            XYPoint { x: 132; y: 4.7 }
            XYPoint { x: 133; y: 3.9 }
            XYPoint { x: 134; y: 5.2 }
            XYPoint { x: 135; y: 4.1 }
            XYPoint { x: 136; y: 4.7 }
            XYPoint { x: 137; y: 3.9 }
            XYPoint { x: 138; y: 5.2 }
            XYPoint { x: 139; y: 4.1 }
            XYPoint { x: 140; y: 4.3 }
            XYPoint { x: 141; y: 4.1 }
            XYPoint { x: 142; y: 4.7 }
            XYPoint { x: 143; y: 3.9 }
            XYPoint { x: 144; y: 5.2 }
            XYPoint { x: 145; y: 4.1 }
            XYPoint { x: 146; y: 4.7 }
            XYPoint { x: 147; y: 3.9 }
            XYPoint { x: 148; y: 5.2 }
            XYPoint { x: 149; y: 4.1 }
        }
    }
}
