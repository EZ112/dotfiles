pragma Singleton
import Quickshell.Services.UPower
import QtQuick
import "../"

QtObject {
    readonly property UPowerDevice battery: UPower.displayDevice
    readonly property bool hasBattery: battery !== null && battery.isPresent
    readonly property real percentage: hasBattery ? Math.floor(battery.percentage * 100) : 0
    readonly property bool charging: hasBattery ? battery.state === UPowerDeviceState.Charging : false

    readonly property color statusColor: {
        if (percentage <= 25)
            return Theme.warningColor;
        if (percentage <= 10)
            return Theme.criticalColor;
        return Theme.fgColor;
    }

    readonly property list<string> icons: ["󰁻", "󰁽", "󰁿", "󰂁", "󰁹"]
    readonly property string icon: {
        if (!hasBattery)
            return "";
        if (charging)
            return "󰂄";
        return icons[Math.min(icons.length - 1, Math.floor(percentage / 20))];
    }

    readonly property string label: icon + " " + percentage + "%"
}
