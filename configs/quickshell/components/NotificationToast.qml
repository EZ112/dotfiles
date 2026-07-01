import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import "../"

Rectangle {
    property Notification notification

    width: 300
    height: layout.implicitHeight + 16
    color: Qt.alpha(Theme.bgColor, 0.8)

    Rectangle {
        anchors.left: parent.left
        height: parent.height
        width: 8
        color: Theme.fgColor
    }

    ColumnLayout {
        id: layout
        width: parent.width - 32
        anchors.centerIn: parent

        Text {
            text: notification.summary
            font {
                family: Theme.fontFamily
                pixelSize: 16
            }
            color: Theme.fgColor
            font.bold: true
        }
        Text {
            Layout.fillWidth: true
            text: notification.body
            font {
                family: Theme.fontFamily
                pixelSize: 12
            }
            color: Theme.fgMutedColor
            wrapMode: Text.WordWrap
            elide: Text.ElideRight
            maximumLineCount: 3
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
