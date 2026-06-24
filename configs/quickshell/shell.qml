import Quickshell
import QtQuick

Variants {
    model: Quickshell.screens
    delegate: Component {
        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: Theme.barHeight
            color: "transparent"

            Bar {
                anchors.fill: parent
            }
        }
    }
}
