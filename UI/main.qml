import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 344
    height: 350
    color: "transparent"
    flags: Qt.Window | Qt.FramelessWindowHint

    property color bg_color: "gold"

    background: Rectangle {
        id: bg
        anchors.centerIn: parent
        width: parent.width - 38
        height: parent.height - 38

        layer.enabled: true
        layer.effect: DropShadow {
            anchors.fill: bg
            horizontalOffset: 3
            verticalOffset: 3
            spread: 0.1
            radius: 28
            samples: (radius * 2) + 1
            color: "#36000000"
            source: bg
        }



    }

    Drawer {
        width: bg.width
        height: 100
        modal: true
        visible: false
        edge: Qt.TopEdge

        Overlay.modal: Rectangle {
            anchors.fill: parent
            anchors.margins: 19
            color: "#77ffffff"
        }

        background: Rectangle {
            x: 19
            y: 19
            implicitWidth: parent.width
            implicitHeight: parent.height
        }

    }

    Rectangle {
        x: 19
        y: 19
        width: bg.width
        height: bg.height
        color: Qt.lighter(bg_color)

        Rectangle {
            id: header
            width: parent.width
            height: 34
            color: bg_color
        }

        Rectangle {
            id: editable_cont
            anchors.top: header.bottom
            anchors.bottom: footer.top
            width: parent.width
            color: "transparent"

            Rectangle {
                width: parent.width
                height: parent.height
                clip: true
                focus: true
                color: "transparent"

                TextEdit {
                    id: editable
                    //x: -sb.position * width
                    y: -sb.position * height
                    width: parent.width
                    height: 400
                    focus: true

                }

                ScrollBar {
                    id: sb
                    visible: true
                    parent: parent
                    x: parent.width - 12
                    y: 0
                    size: parent.height / editable.height
                    //policy: ScrollBar.AlwaysOn
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    orientation: Qt.Vertical
                }
            }

        }

        Rectangle {
            id: footer
            anchors.bottom: parent.bottom
            width: parent.width
            height: 40
            color: "transparent"

            Rectangle {
                anchors.top: parent.top
                width: parent.width
                height: 1
                color: bg_color
            }


        }

    }


}
