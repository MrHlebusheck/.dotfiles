import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData

            color: Qt.rgba(0, 0, 0, 0)

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 24

            TitleWidget {}
            
            Workspaces {
                anchors.centerIn: parent
            }

            ClockWidget {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 2
            }
        }
    }
}
