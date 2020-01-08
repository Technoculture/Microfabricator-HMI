import QtQuick 2.0

Item {
    id: _root

    signal loadMainApp

    property int animateIndex: 0

    state: "a"

    Timer {
        id: timer
        interval: 1000; running: true; repeat: true
        onTriggered: {
            animateIndex++;
            if(animateIndex === 2) { big.destroy() }
            else if(animateIndex === 3) { loadMainApp() }
        }
    }

    Image {
        id: big
        source: "Assets/logo.png"
    }
    Image {
        id: small;
        source: "Assets/logo-small.png"
    }

    states: [
        State { name: "a"; when: animateIndex === 0;
            PropertyChanges { target: big; x: 321; y: 202 }
            PropertyChanges { target: small; x: 321; y: 202; opacity: 0 } },
        State { name: "b"; when: animateIndex === 1;
            PropertyChanges { target: big; x: 75; y: 202; width: 10; opacity: 0 }
            PropertyChanges { target: small; x: 75; y: 202; opacity: 1 } },
        State { name: "c"; when: animateIndex === 2;
            PropertyChanges { target: small; x: 75; y: 334 }
        },
        State { name: "d"; when: animateIndex === 3; PropertyChanges { target: timer; running: false } }
    ]

    transitions: [
        Transition {
            from: "*"; to: "*"
            NumberAnimation {
                properties: "x,y,width,opacity"
                easing.type: Easing.InOutExpo
                duration: 300
            }
        }
    ]

}
