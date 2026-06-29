pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property string time: Qt.formatDateTime(datetime.date, "ddd, dd MMM, HH:mm")

    SystemClock {
        id: datetime
        precision: SystemClock.Seconds
    }
}
