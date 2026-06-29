import QtQuick
import "../"

Rectangle {
    height: Theme.barItemHeight
    width: childrenRect.width + 16
    color: Qt.alpha(Theme.bgColor, 0.8)
    radius: Theme.barRadius
}
