pragma Singleton
import Quickshell.Networking
import QtQuick

QtObject {
    readonly property bool connected: Networking.connectivity !== NetworkConnectivity.None
    readonly property var wifiDevice: Networking.devices.values.find(d => d instanceof WifiDevice)
    readonly property var wiredDevice: Networking.devices.values.find(d => d instanceof WiredDevice)

    readonly property bool isWifi: wifiDevice !== undefined && wifiDevice.state === ConnectionState.Connected
    readonly property bool isEthernet: wiredDevice !== undefined && wiredDevice.state === ConnectionState.Connected

    readonly property int strength: isWifi ? wifiDevice.activeNetwork.strength : 0
    readonly property string ssid: isWifi ? wifiDevice.activeNetwork.ssid : ""

    readonly property var icons: ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]
    readonly property string icon: {
        if (!connected)
            return "󰤭";
        if (isEthernet)
            return "󰈀";

        return icons[Math.min(icons.length - 1, Math.floor(strength / 20))];
    }
}
