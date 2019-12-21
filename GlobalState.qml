pragma Singleton
import QtQuick 2.0

QtObject {
    property alias checkItemsModel: checksModel
    property int currentIndex

    ListModel {
        id: checksModel
        ListElement { name: "Light Engine";             status: "ok";       filename:"LightEngineOk" }
        ListElement { name: "Wafer Placed";             status: "pending";  filename:"WaferPlaced" }
        ListElement { name: "Mask Placed";              status: "pending";  filename:"MaskPlaced" }
        ListElement { name: "Wafer-Mask Distance";      status: "pending";  filename:"WaferaskDistance" }
        ListElement { name: "Tray Closed";              status: "ok";       filename:"TrayClosed" }
        ListElement { name: "Light-Wafer Alignment";    status: "ok";       filename:"LightWaferAlignment" }
        ListElement { name: "Vibration Monitor";        status: "ok";       filename:"VibrationMonitor" }
        ListElement { name: "Set Power";                status: "pending";  filename:"SetPower" }
        ListElement { name: "Set Duration";             status: "pending";  filename:"SetDuration" }
    }
}
