import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.common

RowLayout {
    id: root
    height: parent.height
    Item {
        Layout.fillWidth: true
    }
    Repeater {
        model: 10
        Item {
            id: item
            readonly property int mon: Hyprland.monitorFor(bar.screen).id
            readonly property int ws_id: (10 * mon) + index + 1
            readonly property var ws: Hyprland.workspaces.values.find(w => w.id == ws_id)

            implicitWidth: circleRect.diameter * (ws?.focused ? 2 : 1)
            implicitHeight: circleRect.diameter

            Behavior on implicitWidth {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
            Rectangle {
                id: circleRect
                property int diameter: root.height
                anchors.fill: parent
                radius: Math.min(width, height) / 2

                color: {
                    if (ws === undefined)
                        return Colors.setAlpha(Colors.secondary, 0.2);
                    else if (ws?.focused)
                        return Colors.accent;
                    else if (ws?.urgent)
                        return Colors.error;
                    else
                        return Colors.setAlpha(Colors.secondary, 0.5);
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 150
                    }
                }

                Text {
                    id: textItem
                    font.pixelSize: root.height - 6
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent

                    text: {
                        const ind = index + 1;
                        if (ind == 10)
                            return 0;
                        ind;
                    }
                    color: {
                        if (ws === undefined)
                            return 'transparent';
                        else if (ws.focused)
                            return Colors.primary;
                        else if (ws.urgent)
                            return Colors.error;
                        else
                            return Colors.setAlpha(Colors.primary, 0.5);
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + ws_id)
                }
            }
        }
    }
}
