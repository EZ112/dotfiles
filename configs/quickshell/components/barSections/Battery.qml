import QtQuick
import "../../"

Text {
    visible: BatteryService.hasBattery
    color: BatteryService.statusColor
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize
    text: BatteryService.label
}
