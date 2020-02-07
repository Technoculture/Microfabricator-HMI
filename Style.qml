pragma Singleton
import QtQml 2.12
import QtQuick 2.0
import "./vendor"

QtObject {
    // General
	readonly property color black: "black"
	readonly property color green: "lime"
    readonly property color lightgrey: "lightslategray"
	readonly property color red: "red"
    readonly property color yellow: "yellow"
	readonly property color grey: "lightyellow"
	readonly property color white: "white"

    // Card
	readonly property color bg_checklist: "lightyellow"
	readonly property color bg_drawer: "lightgrey"

    // StatusBar
	readonly property color bg_statusbar: "deepskyblue" // lightgreen and brightgreen: are in: General

    readonly property double clickOpacity: 0.5
}
