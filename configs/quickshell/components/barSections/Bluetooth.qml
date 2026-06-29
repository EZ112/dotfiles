import QtQuick
import "../../"

Text {
    color: BluetoothService.enabled ? Theme.fgColor : Theme.fgMutedColor
    text: BluetoothService.label

    font {
        family: Theme.fontFamily
        pixelSize: Theme.fontSize
    }

    MouseArea {
        anchors.fill: parent
        onClicked: BluetoothService.toggle()
    }
}
