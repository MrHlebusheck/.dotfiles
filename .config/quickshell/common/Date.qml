pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property string date: {
        Qt.formatDateTime(clock.date, "d.M.yyyy");
    }

    SystemClock {
        id: clock
    }
}
