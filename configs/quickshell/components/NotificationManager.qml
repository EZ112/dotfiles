import QtQuick
import "../"

Column {
    topPadding: Theme.barHeight + 8
    spacing: 8

    Repeater {
        model: NotificationService.notifications
        delegate: Loader {
            required property var modelData
            active: modelData !== null
            sourceComponent: NotificationToast {
                notification: modelData
            }
        }
    }
}
