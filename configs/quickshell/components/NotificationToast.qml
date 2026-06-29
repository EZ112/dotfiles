import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import "../"

Rectangle {
    property Notification notification

    width: 300
    height: layout.implicitHeight + 16
    color: Theme.bgColor
    radius: 4

    border {
        color: Qt.alpha(Theme.fgColor, 0.4)
        width: 1
    }

    ColumnLayout {
        id: layout
        width: parent.width - 16
        anchors.centerIn: parent

        Text {
            text: notification.summary
            color: Theme.fgColor
            font.bold: true
        }
        Text {
            text: notification.body
            color: Theme.fgColor
            elide: Text.ElideRight
        }
    }

    Timer {
        interval: Theme.notificationExpireTimeout
        running: true
        onTriggered: notification.expire()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: notification.dismiss()
    }
}
