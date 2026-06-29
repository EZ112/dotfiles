pragma Singleton
import Quickshell.Bluetooth
import QtQuick

QtObject {
    readonly property BluetoothAdapter adapter: Bluetooth.defaultAdapter
    readonly property bool enabled: adapter.enabled
    readonly property var deviceStates: Bluetooth.devices.values.map(d => d.state)
    readonly property BluetoothDevice connectedDevice: Bluetooth.devices.values[deviceStates.indexOf(BluetoothDeviceState.Connected)] ?? null
    readonly property string deviceName: connectedDevice ? connectedDevice.name : ""

    readonly property string icon: {
        if (!enabled)
            return "󰂲";
        if (connectedDevice != null)
            return "󰂱";
        return "󰂰";
    }

    readonly property string label: icon + (connectedDevice ? "  " + deviceName : "")

    function toggle() {
        adapter.enabled = !adapter.enabled;
    }
}
