import QtQuick
import "../"

Item {
    anchors {
        fill: parent
        margins: 4
    }

    Rectangle {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        height: Theme.barItemHeight
        width: workspaces.implicitWidth + 16
        color: Qt.alpha(Theme.bgColor, 0.4)
        radius: Theme.bgRadius

        Workspaces {
            id: workspaces
            anchors.centerIn: parent
        }
    }

    Rectangle {
        anchors.centerIn: parent

        height: Theme.barItemHeight
        width: datetime.implicitWidth + 16
        color: Qt.alpha(Theme.bgColor, 0.4)
        radius: Theme.bgRadius

        Datetime {
            id: datetime
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        height: Theme.barItemHeight
        width: battery.implicitWidth + 16
        color: Qt.alpha(Theme.bgColor, 0.4)
        radius: Theme.bgRadius

        Battery {
            id: battery
            anchors.centerIn: parent
        }
    }
}
