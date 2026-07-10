import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "../"

Scope {
    id: root

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onVolumeChanged() {
            root.showOsd = true;
            hideTimer.restart();
        }
    }

    property bool showOsd: false

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: root.showOsd = false
    }

    LazyLoader {
        active: root.showOsd

        PanelWindow {
            screen: Quickshell.screens.find(s => s.name === Theme.mainMonitor)

            anchors.bottom: true
            margins.bottom: 80
            exclusiveZone: 0

            implicitWidth: 250
            implicitHeight: 50
            color: "transparent"

            mask: Region {}

            Rectangle {
                anchors.fill: parent
                radius: height / 2
                color: Theme.bgColor

                RowLayout {
                    anchors {
                        fill: parent
                        leftMargin: 10
                        rightMargin: 15
                    }

                    Text {
                        font {
                            family: Theme.fontFamily
                            pixelSize: 30
                        }
                        text: "󰕾"
                        color: Theme.fgColor
                    }

                    Rectangle {
                        Layout.fillWidth: true

                        implicitHeight: 10
                        radius: 20
                        color: Qt.alpha(Theme.fgColor, 0.5)

                        Rectangle {
                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }

                            implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
                            radius: parent.radius
                            color: Theme.fgColor
                        }
                    }
                }
            }
        }
    }
}
