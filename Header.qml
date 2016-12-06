import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id:maintitle
    Text {
        id: title
        font.bold: true
        font.pointSize: 18
        font.italic: true//斜体
        font.family: "华文行楷"

        color: "#ffffffff"
        text: qsTr("虎扑体育")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }
    Rectangle
    {
        width: 20
        height: 20
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        radius: 5
        Button
        {
            id:search
            anchors.fill: parent
        }
    }
}
