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
            Bar {
                required property ShellScreen modelData
                screen: modelData
            }
        }
    }

    PanelWindow {
        anchors {
            top: true
            right: true
        }
        screen: Quickshell.screens.find(s => s.name === Theme.mainMonitor)

        width: notifManager.implicitWidth
        height: notifManager.implicitHeight
        color: "transparent"
        exclusionMode: ExclusionMode.Ignore

        NotificationManager {
            id: notifManager
        }
    }
}
