import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Controls.Styles 1.1
import "DBConnect.js" as DBConn
Window
{
    id:root
    visible: true
    width: 360
    height: 720
    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.Window

    //更新数据函数
    function loadData(iIndex)
    {
        listViewTab.currentIndex = iIndex;
        contentRec.currentChanged1(iIndex);
        //listViewPage.positionViewAtIndex(index,ListView.Center);
        //listViewPage.currentItem.loadData();//QAirTicketListViewPage中有loadData()函数
    }

    Rectangle
    {
        id:rect11
        width: parent.width
        height: parent.height
        anchors.fill: parent
    PageWidget
    {
        id:page1
        state: "active"
        color: "red"
        z:2
        Button
        {
            width:40
            height: 40
            anchors.centerIn: parent
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    page2.state='active';
                    page1.state='hide';
                }
            }
        }
    }

    PageWidget
    {
        id:page2
//        width: parent.width
//        height: parent.height
//        radius: 10
//        anchors.fill: parent
        Header
        {
            id:header
            z:1
            width: parent.width
            height: 60
            anchors.top: parent.top
            color: "#a31c19"
            MouseArea
            {
                anchors.fill: parent
                property variant previousPosition
                onPressed:
                {
                    previousPosition = Qt.point(mouseX, mouseY)
                }
                onPositionChanged:
                {
                    if (pressedButtons == Qt.LeftButton)
                    {
                        var dx = mouseX - previousPosition.x
                        var dy = mouseY - previousPosition.y
                        root.x = root.x + dx
                        root.y = root.y + dy
                    }
                }
            }
        }
        Rectangle//APP上方Tab选项卡
        {
            id:titlebarRec
            z:1
            height:40
            width:header.width
            anchors
            {
                left:header.left
                top:header.bottom
            }
            ListModel
            {
                id:titleTab
                ListElement
                {
                    name:"NBA"
                }
                ListElement
                {
                    name:"CBA"
                }
                ListElement
                {
                    name:"国际足球"
                }
                ListElement
                {
                    name:"西甲"
                }
                ListElement
                {
                    name:"中国足球"
                }
                ListElement
                {
                    name:"英超"
                }
                ListElement
                {
                    name:"意甲"
                }
                ListElement
                {
                    name:"德甲"
                }
                ListElement
                {
                    name:"法甲"
                }
                ListElement
                {
                    name:"欧冠"
                }
                ListElement
                {
                    name:"欧联"
                }
                ListElement
                {
                    name:"世预赛"
                }
            }
            ScrollView
            {
                width: parent.width
                height: parent.height
                flickableItem.interactive: true
                anchors.fill: parent
                ListView
                {
                    id: titleViewTab
                    anchors.fill: parent
                    orientation: ListView.Horizontal
                    snapMode: ListView.SnapToItem
                    //interactive:false
                    model: titleTab
                    delegate: NavgationDelegate
                    {
                        itemWidth:60
                        itemHeight:parent.height
                        bkColor:"#f5f5f5"
                }
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
    Item//添加按钮
    {
        id: addBtn
        z:2
        anchors.right:titlebarRec.right
        anchors.verticalCenter:titlebarRec.verticalCenter
        width:40
        height:titlebarRec.height
        Image {
            id: addimg
            anchors.centerIn: parent
            source: "images/mobile.png"
        }
        MouseArea
        {
           anchors.fill: parent
            onClicked:
            {
                page2.state='hide';
                page1.state='active';
            }
        }
    }

    //主要内容展示区
    Rectangle
    {
        id:contentRec
        anchors.top: titlebarRec.bottom
        width: parent.width
        anchors.bottom: toolbarRec.top
        color:"#dff3f9"
        property int current: 0

        function currentChanged1(curIndex)
        {
            if(curIndex!==current)
            {
                contentRec.children[curIndex].x=width
                contentRec.children[curIndex].state='active'
                contentRec.children[current].state='hide'
                current = curIndex
            }
        }
        PageWidget
        {
            id:page11
            state: "active"
            NBAGames
            {
                id:model_nba_games
            }
            ScrollView
            {
                width: parent.width
                height: parent.height

                flickableItem.interactive: true
                anchors.fill: parent
                ListView
                {
                    id:listView1
                    anchors.fill: parent
                    orientation: ListView.Vertical
                    model: model_nba_games
                    delegate: NBAGamesDelegate
                    {
                        itemWidth:parent.width
                        itemHeight:80/*rect1.height/model_nba_games.count*/
                        bkColor:"#dff3f9"
                    }
                 }
                 style: ScrollViewStyle
                 {
                     transientScrollBars: true
                     handle: Item
                     {
                         implicitWidth: 14
                         implicitHeight: 26
                         Rectangle
                         {
                             color: "#424246"
                             radius: 4
                             anchors.fill: parent
                             anchors.topMargin: 6
                             anchors.leftMargin: 4
                             anchors.rightMargin: 4
                             anchors.bottomMargin: 6
                         }
                     }
                     scrollBarBackground: Item
                     {
                         implicitWidth: 14
                         implicitHeight: 26
                     }
                 }
             }
        }
        PageWidget
        {
            Rectangle
            {
                anchors.fill: parent
                color:"#BB00FF00"
                Text
                {
                    font.pointSize: 50
                    font.family: "微软雅黑"
                    color:"#FFFFFF"
                    anchors.centerIn: parent
                    text:"page2"
                }
            }
        }
        PageWidget
        {
            Rectangle
            {
                anchors.fill: parent
                color:"#990000FF"
                Text
                {
                    font.pointSize: 50
                    font.family: "微软雅黑"
                    color:"#FFFFFF"
                    anchors.centerIn: parent
                    text:"page3"
                }
            }
        }
        PageWidget
        {
            Rectangle
            {
                anchors.fill: parent
                color:"#FFFF9900"
                Text
                {
                    font.pointSize: 50
                    font.family: "微软雅黑"
                    color:"#FFFFFF"
                    anchors.centerIn: parent
                    text:"page4"
                }
            }
        }
        PageWidget
        {
            Rectangle
            {
                anchors.fill: parent
                color:"#FF00FFFF"


                Text
                {
                    font.pointSize: 50
                    font.family: "微软雅黑"
                    color:"#FFFFFF"
                    anchors.centerIn: parent
                    text:"page5"
                }

            }
        }
        MouseArea
        {

        }

    }

    Rectangle//APP下方Tab选项卡
    {
        id:toolbarRec
        z:1
        x: 0
        y: 660
        anchors.bottom: parent.bottom
        width: parent.width
        height: 60
        anchors.bottomMargin: 0
        ListModel
        {
            id:listTab
            ListElement
            {
                name:"比赛"
            }
            ListElement
            {
                name:"新闻"
            }
            ListElement
            {
                name:"论坛"
            }
            ListElement
            {
                name:"数据"
            }
            ListElement
            {
                name:"更多"
            }
        }

        ListView
        {
            id: listViewTab
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            orientation: ListView.Horizontal
            interactive:false
            model: listTab
            delegate: Rectangle
            {
            height:parent.height
            width:listViewTab.width / listTab.count
            color:"#F5F5F5"
            Text
            {
                id:text1
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text:name
                font.pixelSize: 12
                color: listViewTab.currentIndex === index ?"#3399db":"#353535"

            }
            Rectangle
            {
                id: line1
                height: 2;width: 0.85 * parent.width
                visible: listViewTab.currentIndex === index ? true : false
                color:"#3399db"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: text1.bottom;
                anchors.topMargin: 1

            }
            MouseArea
            {
                hoverEnabled: false
                anchors.fill: parent
                onClicked: {
                    listViewTab.currentIndex=index;
                    console.log("index=",index);
                }
            }
        }
    }
}
}
}
}
