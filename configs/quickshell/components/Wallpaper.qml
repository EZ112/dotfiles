import Quickshell
import Quickshell.Wayland
import QtQuick
import QtMultimedia
import "../"

PanelWindow {
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    WlrLayershell.layer: WlrLayer.Background
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    color: Theme.bgColor

    MediaPlayer {
        id: player
        source: Theme.wallpaperPath + Theme.defaultWallpaper
        loops: MediaPlayer.Infinite
        playbackRate: 1.0
        videoOutput: videoOutput
        audioOutput: AudioOutput {
            volume: 0
        }
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
    }

    Component.onCompleted: player.play()
}
