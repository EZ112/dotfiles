import Quickshell
import QtQuick
import "../../"

Text {
    id: root
    color: Theme.fgColor
    font {
        family: Theme.fontFamily
        pixelSize: Theme.fontSize
    }

    SystemClock {
        id: datetime
        precision: SystemClock.Minutes
    }

    text: Qt.formatDateTime(datetime.date, "ddd, dd MMM, HH:mm")
}
