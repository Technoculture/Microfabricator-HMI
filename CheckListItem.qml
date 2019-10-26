import QtQuick 2.0

Item {
    id: root
    property string name: "Hello"
    property string status: "pending"

    width: parent.width
    height: 40

    Rectangle {
        id: baseRect
        anchors.fill: parent
        color: { root.status === "pending" ? "red" : "green" }
    }

    Text {
        id: checkItemName
        anchors.verticalCenter: baseRect.verticalCenter
        anchors.left: baseRect.left
        anchors.leftMargin: 10

        text: root.name
    }
}
