pragma Singleton
import Quickshell.Networking
import QtQuick

QtObject {
    readonly property bool connected: Networking.connectivity !== NetworkConnectivity.None
    readonly property var wifiDevice: Networking.devices.values.find(d => d instanceof WifiDevice)
    readonly property var wiredDevice: Networking.devices.values.find(d => d instanceof WiredDevice)

    readonly property bool isWifi: wifiDevice !== undefined && wifiDevice.state === ConnectionState.Connected
    readonly property bool isEthernet: wiredDevice !== undefined && wiredDevice.state === ConnectionState.Connected

    readonly property var wifiNetwork: {
        if (!isWifi)
            return null;
        return wifiDevice.networks.values.find(d => d instanceof WifiNetwork);
    }
    readonly property int strength: {
        if (!wifiNetwork)
            return 0;
        return Math.round(wifiNetwork.signalStrength * 100);
    }

    readonly property var icons: ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]
    readonly property string icon: {
        if (!connected)
            return "󰤭";
        if (isEthernet)
            return "󰈀";

        return icons[Math.min(icons.length - 1, Math.floor(strength / 20))];
    }
}
