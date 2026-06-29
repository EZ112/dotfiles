import QtQuick
import "../../"

Text {
    visible: BatteryService.hasBattery
    color: BatteryService.statusColor
    text: BatteryService.label

    font {
        family: Theme.fontFamily
        pixelSize: Theme.fontSize
    }
}
