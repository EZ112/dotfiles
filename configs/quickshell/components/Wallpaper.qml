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
        source: Theme.wallpaperPath + Theme.defaultWallpaper
        autoPlay: true
        loops: MediaPlayer.Infinite
        playbackRate: 1.0
        videoOutput: videoOutput
        audioOutput: AudioOutput {
            muted: true
            volume: 0
        }
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
    }
}
