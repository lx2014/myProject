import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window
{
    id:testroot
    visible: true
    width: 360
    height: 480

    ListModel
    {
         id: dataBank

         ListElement
         {
             value: "已添加比赛"
             type: "header"
         }
         ListElement
         {
             value: "Dummy text 1"
             type: "text"
         }
         ListElement
         {
             value: "Dummy text 2"
             type: "text"
         }
         ListElement
         {
             value: "未添加比赛"
             type: "header"
         }
         ListElement
         {
             value: "Dummy text 1"
             type: "text"
         }
         ListElement
         {
             value: "Dummy text 2"
             type: "text"
         }
     }
     ScrollView
     {
        id:scroll
        width: parent.width
        height: parent.height
        flickableItem.interactive: true
        anchors.fill: parent
        ListView
        {
            id: titleViewTab
            anchors.fill:parent
            orientation: ListView.Vertical
            snapMode: ListView.SnapOneItem
            model: dataBank
            delegate: MultiDelegate{}
       }

      style: ScrollViewStyle//通过设置滚动条尺寸为0隐藏滚动条
      {
          transientScrollBars: true
          handle: Item
          {
            width:0
            height:0
          }
          scrollBarBackground: Item
          {
            width:0
            height:0
          }
        }
    }
}
