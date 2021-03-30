import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 312
    height: 312
    color: "transparent"
    flags: Qt.Window | Qt.FramelessWindowHint

    property color bg_color: "gold"

    background: Rectangle {
        id: bg
        anchors.centerIn: parent
        width: parent.width - 24
        height: parent.height - 24
        color: bg_color

        layer.enabled: true
        layer.effect: DropShadow {
            anchors.fill: bg
            horizontalOffset: 0
            verticalOffset: 0
            //spread: 1
            radius: 12
            samples: (radius * 2) + 1
            color: "#50000000"
            source: bg
        }

    }

    Drawer {
        width: 24
        height: 48
        visible: true

        Text {
            text: "Yep"
        }

    }

}
