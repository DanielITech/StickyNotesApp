import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    width: parent.width

    background: Rectangle {
        implicitWidth: 128
        implicitHeight: 50
        color: parent.hovered ? "#eee": "white"
    }

}
