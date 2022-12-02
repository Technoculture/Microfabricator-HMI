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
            width:224
            height: 315.2
            color:"black"
            radius: 20
        }
        Grid{
            rows: 2
            spacing: 24
            Grid{
                columns: 4
                spacing: 24
                Rectangle{
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                }
                Rectangle{
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                }
                Rectangle{
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                }
                Rectangle{
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                }
            }
            Grid{
                columns: 3
                spacing: 24
                Rectangle{
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                }
                Rectangle{
                    width:100
                    height: 145.6
                    color:"black"
                    radius: 20
                }
                Rectangle{
                    width:224
                    height: 145.6
                    color:"black"
                    radius: 20
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
