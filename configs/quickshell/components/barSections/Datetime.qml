import QtQuick
import "../../"

Text {
    color: Theme.fgColor

    font {
        family: Theme.fontFamily
        pixelSize: Theme.fontSize
    }

    text: DatetimeService.time
}
