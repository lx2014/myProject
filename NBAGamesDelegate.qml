import QtQuick 2.0

Rectangle
{
    id:delegate_Item
    property bool selected: ListView.isCurrentItem
    property real itemWidth
    property real itemHeight
    property color bkColor
    width: itemWidth
    height: itemHeight
    color: bkColor
    Grid
    {
        id: grid1
        columns: 3
        width: delegate_Item.width*3/5
        height: delegate_Item.height
        Rectangle
        {
            id:rect_logo_visit
            width: delegate_Item.width/5
            height: itemHeight/2
            color: delegate_Item.color
            Image
            {
                id: logo_visit//客队
                anchors.centerIn: parent
                source: pic_visit
            }
        }
        Rectangle
        {
            id:rect_team_visit
            width: delegate_Item.width/5
            height: itemHeight/2
            color: delegate_Item.color
            Text
            {
                id: team_visit
                anchors.centerIn: parent
                text: name_visit
            }
        }
        Rectangle
        {
            id:rect_score_visit
            width: delegate_Item.width/5
            height: itemHeight/2
            color: delegate_Item.color
            Text
            {
                id: score_visit
                anchors.centerIn: parent
                text: scoreVisit
            }
        }
        Rectangle
        {
            id:rect_logo_home
            width: delegate_Item.width/5
            height: itemHeight/2
            color: delegate_Item.color
            Image
            {
                id: logo_home//主队
                anchors.centerIn: parent
                source: pic_home
            }
        }
        Rectangle
        {
            id:rect_team_home
            width: delegate_Item.width/5
            height: itemHeight/2
            color: delegate_Item.color
            Text
            {
                id: team_home
                anchors.centerIn: parent
                text: name_home
            }
        }
        Rectangle
        {
            id:rect_score_home
            width: delegate_Item.width/5
            height: itemHeight/2
            color: delegate_Item.color
            Text
            {
                id: score_home
                anchors.centerIn: parent
                text: scoreHome
            }
        }
    }

    Rectangle
    {
        id: column1
        anchors.left: grid1.right
        anchors.top: parent.top
        width: delegate_Item.width/5
        height: itemHeight
        color: delegate_Item.color
        Text
        {
            id: game_state
            anchors.centerIn: parent
            text: gameState
        }
    }


    Rectangle
    {
        id: column2
        anchors.left: column1.right
        anchors.top: parent.top
        width: delegate_Item.width/5
        height: itemHeight
        color: delegate_Item.color
        Text
        {
            id: game_highlight//比赛集锦
            anchors.centerIn: parent
            text: gameHighlight
        }
    }

    Rectangle//元素之间的分割线
    {
        id:split_line
        anchors.bottom:parent.bottom
        width:parent.width
        height:1
        color:"#5cadad"
    }

    MouseArea
    {
        hoverEnabled: false
        anchors.fill: parent
        onClicked:
        {
            listView1.currentIndex=index;
            //clickedItem.start();
        }
    }
    ColorAnimation on color
    {
        id:clickedItem
        running:selected
        to: "lightsteelblue"
        duration: 500
    }
    ColorAnimation on color
    {
        id:unclickedItem
        running:!selected
        to: bkColor
        duration: 500
    }
}
