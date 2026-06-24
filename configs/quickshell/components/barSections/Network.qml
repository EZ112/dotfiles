import QtQuick
import "../../"

Text {
    color: NetworkService.connected ? Theme.fgColor : Theme.criticalColor
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize
    text: NetworkService.icon + "  " + NetworkService.strength + "%"
}
