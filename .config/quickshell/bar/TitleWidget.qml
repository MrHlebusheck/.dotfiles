import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.common

Rectangle {
    color: Colors.accent
    implicitWidth: title.width + 20
    implicitHeight: parent.height
    radius: Math.min(width, height) / 2
    opacity: title.text.length > 0 ? 1 : 0

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
    }
    Behavior on opacity {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
    }

    Text {
        id: title
        color: Colors.primary
        font.pixelSize: parent.height - 6
        font.bold: true
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.centerIn: parent
        width: showFull ? implicitWidth : Math.min(implicitWidth, 300)
        clip: true

        property bool showFull: false
        
        text: Title.getLastWindowTitle(bar.screen)
        
        MouseArea {
            anchors.fill: parent
            onClicked: {
              title.showFull = !title.showFull
            }
        }
    }
}
