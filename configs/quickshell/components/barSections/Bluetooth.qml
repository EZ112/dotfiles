import QtQuick
import "../../"

Text {
    color: BluetoothService.enabled ? Theme.fgColor : Theme.fgMutedColor
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize
    text: BluetoothService.label

    MouseArea {
        anchors.fill: parent
        onClicked: BluetoothService.toggle()
    }
}
