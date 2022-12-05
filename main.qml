import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    title: "MicroFabricator"
    visible: true
    width: 820
    height: 480
    Grid{
        padding: 40
        spacing: 24
        rows: 2
        columns: 2
//        Grid.horizontalItemAlignment: Grid.AlignHCenter
//        Grid.verticalItemAlignment: Grid.AlignVCenter
        Rectangle{
            id:display
            width:224
            height: 315.6
            color:"black"
            radius: 20
            opacity: 0.8
            Text {
                id: mt0
                text: "Duration"
                color: "white"
                font.pixelSize: 24
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
            }
            Rectangle {
                radius: 20
                width:224
                height: 53.2
                color: "black"
                Text {
                    id: t0
                    text: "Measurements"
                    x:12
                    anchors.centerIn: parent
                    color: "orange"
                    font.pixelSize: 22
                }
                Rectangle {
                    width: parent.radius
                    height: parent.radius
                    anchors {
                        top: parent.top
                        right: parent.right
                        left: parent.left
                    }
                    color: parent.color
                }
                anchors.bottom: parent.bottom
            }
        }
        Grid{
            rows: 2
            spacing: 24
            Grid{
                columns: 4
                spacing: 24
                Rectangle{
                    radius: 20
                    width: 104
                    height: 145.6
                    Card{
                        cardOpacity: 0.8
                        headText: "Wafer Stage"
                        body0Text: "Open"
                        body0X: 22
                        body0Y: 24
                    }
                }
                Rectangle{
                    radius: 20
                    width: 104
                    height: 145.6
                    Card{
                        cardOpacity: 0.8
                        headText: "Wafer Clamp"
                        body0Text: "Off"
                        body0X: 32
                        body0Y: 24
                    }
                }
                Rectangle{
                    radius: 20
                    width: 104
                    height: 145.6
                    Card{
                        cardOpacity: 0.8
                        headText: "Wafer Mask Gap"
                        body0Text: "2.8μm"
                        body0X: 19
                        body0Y: 24
                    }
                }
                Rectangle{
                    radius: 20
                    width: 104
                    height: 145.6
                    Card{
                        cardOpacity: 0.8
                        headText: "Vibration"
                        body0Text: "Ok"
                        body0X: 36
                        body0Y: 24
                    }
                }
            }
            Grid{
                columns: 3
                spacing: 24
                Rectangle{
                    radius: 20
                    width: 105
                    height: 145.6
                    Card{
                        cardOpacity: 0.8
                        headText: "Light Intensity"
                        body0Text: "21%"
                        body0X: 12
                        body0Y: 15
                        body1Text: "321 mJ/cm<sup>2</sup>"
                        body1Visible: true
                        body1X: 12
                        body1Y: 44
                    }
                }
                Rectangle{
                    radius: 20
                    width: 105
                    height: 145.6
                    Card{
                        cardOpacity: 0.8
                        headText: "Duration"
                        body0Text: "112s"
                        body0X: 12
                        body0Y: 15
                        body1Text: "1m 32s"
                        body1Visible: true
                        body1X: 12
                        body1Y: 44
                    }
                }
                Rectangle{
                    id:history
                    width:224
                    height: 145.6
                    color:"black"
                    radius: 20
                    opacity: 0.9
                    Text {
                        id: mt7
                        text: "History"
                        x:16
                        y:8
                        color: "white"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                    }
                    Rectangle {
                        radius: 20
                        width:224
                        height: 105.6
                        color: "black"
                        Text {
                            id: t7
                            text: "History List"
                            x:12
                            anchors.centerIn: parent
                            color: "orange"
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: parent.radius
                            height: parent.radius
                            anchors {
                                top: parent.top
                                right: parent.right
                                left: parent.left
                            }
                            color: parent.color
                        }
                        anchors.bottom: parent.bottom
                    }
                }
            }
        }
        Rectangle{
            width:224
            height: 60.8
            color:"black"
            radius: 20
        }
    }
}
