import QtQuick 2.0

Rectangle
{
    id:delegate_Nav
    property bool selected: ListView.isCurrentItem
    property real itemWidth
    property real itemHeight
    property color bkColor
    width: itemWidth
    height: itemHeight
    color: bkColor
    Text
    {
        id:text2
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text:name
        font.pixelSize: 12
        color: titleViewTab.currentIndex === index ?"#3399db":"#353535"
    }
    Rectangle
    {
        id: line2
        height: 2;width: 0.85 * parent.width
        visible: titleViewTab.currentIndex === index ? true : false
        color:"#3399db"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: text2.bottom;
        anchors.topMargin: 1

    }
    MouseArea
    {
        hoverEnabled: false
        anchors.fill: parent
        onClicked:
        {
            titleViewTab.currentIndex=index;
            contentRec.currentChanged1(index);
            console.log("index=",index);

        }
    }
}
