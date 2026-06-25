import Quickshell
import QtQuick

ShellRoot {
    Variants {
        model: Quickshell.screens
        delegate: Component {
            Wallpaper {
                required property ShellScreen modelData
                screen: modelData
            }
        }
    }

    Variants {
        model: Quickshell.screens
        delegate: Component {
            PanelWindow {
                required property ShellScreen modelData
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
}
