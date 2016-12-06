import QtQuick 2.0

//主要内容展示文件
Rectangle
{
    id:content
    width:parent.width
    anchors.top: toolbar.bottom
    anchors.topMargin: -5
    height: 500
    color:"red"

    property int current: 0

    function currentChanged1(curIndex)
    {
        content.children[curIndex].x=width
        content.children[curIndex].state='active'
        content.children[current].state='hide'
        current = curIndex
    }

}
