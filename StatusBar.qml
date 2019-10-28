import QtQuick 2.0

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
    // =============================================================================================


    // INITIALIZATION
    state: "waitingForChecks"
    UIStyle { id: style }

    // COMPONENTS
    Rectangle {
        id: baseRect
        height: 42; width: 644
        anchors.centerIn: parent
    }

    Text {
        id: statusText
        anchors.centerIn: baseRect
        font { pixelSize: 18; family: "Helvetica" }
    }
    // =============================================================================================


    // INTERACTIONS
    property int _stateIndex: 0
    MouseArea {
        anchors.fill: baseRect
        onClicked: {
            _stateIndex++;
            switch(_stateIndex % 5){
            case 0: _root.state = 'waitingForChecks';    break;
            case 1: _root.state = 'readyToExpose';       break;
            case 2: _root.state = 'pauseExposure';
                expose(); break;
            case 3: _root.state = 'openTray';
                exposureComplete(); break;
            case 4: _root.state = 'closeTray';
                openTray(); break;
            } //    console.log("stateIndex(" + _stateIndex%4 + ") -> " + root.state)
        }
    }

    // STATE
    states: [
        State { name: "waitingForChecks";
            PropertyChanges { target: _root; _color: style.bg_statusbar; _text: "Waiting for checks" } },
        State { name: "readyToExpose";
            PropertyChanges { target: _root; _color: style.lightgreen;   _text: "Ready to expose" } },
        State { name: "pauseExposure";
            PropertyChanges { target: _root; _color: style.lightyellow;   _text: "Pause the exposure" } },
        State { name: "openTray";
            PropertyChanges { target: _root; _color: style.brightgreen;  _text: "Open Tray" } },
        State { name: "closeTray";
            PropertyChanges { target: _root; _color: style.brightgreen;  _text: "Close Tray" } }
    ]
    // =============================================================================================
}

