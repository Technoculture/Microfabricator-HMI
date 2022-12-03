import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    title: "MicroFabricator"
    visible: true
    width: 800
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
                    id: stage
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                    opacity: 0.8
                    Text {
                        id: mt1
                        text: "Wafer Stage"
                        x:10
                        y:12
                        color: "white"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                    }
                    Rectangle {
                        radius: 20
                        width:100
                        height: 80
                        color: "black"
                        Text {
                            id: t1
                            text: "Open"
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
                Rectangle{
                    id:clamp
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                    opacity: 0.8
                    Text {
                        id: mt2
                        text: "Wafer Clamp"
                        x:10
                        y:12
                        color: "white"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                    }
                    Rectangle {
                        radius: 20
                        width:100
                        height: 80
                        color: "black"
                        Text {
                            id: t2
                            text: "Off"
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
                Rectangle{
                    id:maskgap
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                    opacity: 0.8
                    Text {
                        id: mt3
                        text: "Wafer Mask Gap"
                        width: 80
                        height: 41.6
                        x:10
                        y:12
                        color: "white"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                    }
                    Rectangle {
                        radius: 20
                        width:100
                        height: 80
                        color: "black"
                        Text {
                            id: t3
                            text: "2.8μm"
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
                Rectangle{
                    id:vibration
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                    opacity: 0.8
                    Text {
                        id: mt4
                        text: "Vibration"
                        x:10
                        y:12
                        color: "white"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                    }
                    Rectangle {
                        radius: 20
                        width:100
                        height: 80
                        color: "black"
                        Text {
                            id: t4
                            text: "Ok"
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
            Grid{
                columns: 3
                spacing: 24
                Rectangle{
                    id:lightIntensity
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                    opacity: 0.8
                    Text {
                        id: mt5
                        text: "Light Intensity"
                        width: 76
                        height: 41.6
                        x:10
                        y:12
                        color: "white"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                    }
                    Rectangle {
                        radius: 20
                        width:100
                        height: 80
                        color: "black"
                        Text {
                            id: t5
                            text: "21%"
                            x:12
                            anchors.verticalCenter: parent.verticalCenter
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
                Rectangle{
                    id:duration
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                    opacity: 0.8
                    Text {
                        id: mt6
                        text: "Duration"
                        x:10
                        y:12
                        color: "white"
                        font.pixelSize: 15
                        wrapMode: Text.WordWrap
                    }
                    Rectangle {
                        radius: 20
                        width:100
                        height: 80
                        color: "black"
                        Text {
                            id: t6
                            text: "112s"
                            x:12
                            anchors.verticalCenter: parent.verticalCenter
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
