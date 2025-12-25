pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Hyprland

Singleton {
    function getLastWindowTitle(screen){
      const mon =  Hyprland.monitorFor(screen)
      return mon.activeWorkspace.lastIpcObject.lastwindowtitle || ""
    }
    Component.onCompleted: {
      Hyprland.rawEvent.connect(Hyprland.refreshWorkspaces)
    }
}
