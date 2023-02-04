import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4

Slider {
    id:control

    property color color: 'black'
    property color colorTheme: 'grey'
    property bool showValue: true
    background: Rectangle {

        x: control.leftPadding ;
        y: control.topPadding + (control.availableHeight / 2 - height / 2)

        width: control.availableWidth
        height: parent.height
        radius: 12
        color: "#262626"
    }

    handle: Rectangle {
        id: sliderHandle
        x: control.leftPadding  + control.visualPosition * (control.availableWidth- width)
        y: control.topPadding + control.availableHeight / 2 - height / 2

        height: width*2-15
        width: control.height/2

        radius: width/5

        border{

            width: width
            color: control.pressed ? Qt.lighter(colorTheme,1.3)
                                                  : Qt.lighter(colorTheme,1.5)
            Behavior on width{
               NumberAnimation {
                   duration: 100;
               }
           }
        }
    }
}
