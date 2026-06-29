import QtQuick
import "../../"

Text {
    font {
        family: Theme.fontFamily
        pixelSize: Theme.fontSize
    }

    color: NetworkService.connected ? Theme.fgColor : Theme.criticalColor
    text: NetworkService.label
}
