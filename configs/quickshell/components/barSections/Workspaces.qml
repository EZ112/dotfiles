import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../../"

RowLayout {
    spacing: 8

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            required property HyprlandWorkspace modelData

            Layout.preferredWidth: modelData.active ? 52 : 24
            Layout.preferredHeight: 18
            radius: 4
            color: modelData.active ? Theme.fgColor : Theme.fgMutedColor

            Behavior on Layout.preferredWidth {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }

            Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                text: parent.modelData.id
                color: Theme.bgColor

                font {
                    family: Theme.fontFamily
                    pixelSize: Theme.fontSize
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + parent.modelData.id + " })")
            }
        }
    }
}
