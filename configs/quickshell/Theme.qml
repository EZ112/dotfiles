pragma Singleton
import QtQuick

QtObject {
    readonly property string fontFamily: "Inconsolata Nerd Font"
    readonly property int fontSize: 14

    readonly property color bgColor: "#282828"
    readonly property color fgColor: "#EBDBB2"
    readonly property color fgMutedColor: "#A89984"

    readonly property color warningColor: "#D79921"
    readonly property color criticalColor: "#CC241D"

    readonly property int bgRadius: 8
    readonly property int barHeight: 36
    readonly property int barItemHeight: barHeight - 8
}
