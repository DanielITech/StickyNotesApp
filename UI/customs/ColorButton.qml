import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: btn

    property color color: "black"

    background: Rectangle {
        implicitWidth: 44
        implicitHeight: 52
        color:btn.color
    }

}
