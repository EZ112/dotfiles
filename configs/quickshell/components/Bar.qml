import Quickshell
import QtQuick
import QtQuick.Layouts
import "../"

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Theme.barHeight
    color: "transparent"

    Item {
        anchors {
            fill: parent
            margins: 4
        }

        BarSection {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            Workspaces {
                anchors.centerIn: parent
            }
        }

        BarSection {
            anchors.centerIn: parent

            Datetime {
                anchors.centerIn: parent
            }
        }

        BarSection {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            RowLayout {
                anchors.centerIn: parent
                spacing: 8

                Bluetooth {}
                Network {}
                Battery {}
            }
        }
    }
}
