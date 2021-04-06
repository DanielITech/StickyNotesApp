import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

import "customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 344
    height: 350
    color: "transparent"
    flags: Qt.Window | Qt.FramelessWindowHint

    property int prevX
    property int prevY

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

            RowLayout {
                anchors.fill: parent

                Cust.CustomButton {
                    text: "+"
                }

                Row {
                    Layout.alignment: Qt.AlignRight

                    Cust.CustomButton {
                        text: "-"
                    }

                    Cust.CustomButton {
                        text: "="
                    }

                }
            }

            MouseArea {
                anchors.fill: parent
                //hoverEnabled: true

                onPressed: {
                    prevX = mouseX
                    prevY = mouseY
                }

                onMouseXChanged: {
                    var dx = mouseX - prevX
                    mainWindow.setX(mainWindow.x + dx)
                }

                onMouseYChanged:  {
                    var dy = mouseY - prevY
                    mainWindow.setY(mainWindow.y + dy)
                }
            }

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
                    font.family: "Roboto"
                    font.pixelSize: 14
                    padding: 12
                    wrapMode: TextEdit.Wrap
                    selectByMouse: true

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

                Row {
                    anchors.fill: parent
                    anchors.margins: 4
                    spacing: 12

                    Cust.CustomToolButton {
                        text: "B"
                    }

                    Cust.CustomToolButton {
                        text: "I"
                    }


                }

            }


        }

    }


}
