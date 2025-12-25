import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.common

Rectangle {
    color: Colors.accent
    implicitWidth: clock.width + 12
    implicitHeight: clock.height
    radius: Math.min(width, height) / 2

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
    }

    Text {
        id: clock
        color: Colors.primary
        font.pixelSize: bar.height - 6
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.centerIn: parent

        property bool showDate: false
        text: showDate ? Time.datetime : Time.time
        MouseArea {
            anchors.fill: parent
            onClicked: {
              clock.showDate = ! clock.showDate
            }
        }
    }
}
