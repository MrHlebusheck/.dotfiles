pragma Singleton
import QtQuick

QtObject {
    readonly property color background:     "#0f0f12"
    readonly property color surface:         "#1a1a1f"
    readonly property color overlay:         "#141118"

    readonly property color primary:         "#ffffff"
    readonly property color secondary:       "#b0b0c0"
    readonly property color disabled:        "#686870"

    readonly property color accent:          "#4cc9f0"
    readonly property color success:         "#32b85c"
    readonly property color warning:         "#f8c044"
    readonly property color error:           "#f25c5c"

    function setAlpha(color:color, alpha: double):color {
        return Qt.rgba(color.r, color.g, color.b, alpha);
    }
}
