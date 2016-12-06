import QtQuick 2.7

Item
{
  id: multiDelegate
  height: 60
  width: multiDelegate.ListView.view.width

  function bestDelegate(t)
  {
    if(t == "header")
    {
      return headerDelegate;
    }
    return txtDelegate; // t == "text"
  }

  Component
  {
    id: headerDelegate

    Rectangle
    {
      id: rect1
      width: multiDelegate.width
      height: 60
      color: "#34cf45"
      Text
      {
          id: name
          anchors.centerIn: parent
          text: value
      }
    }
  }

  Component
  {
    id: txtDelegate

    Text
    {
      id: txt
      text: value
      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter
    }
  }

  Loader
  {
    id: itemDisplay
    anchors.fill: parent;
    anchors.topMargin: 2
    anchors.bottomMargin: 2
    sourceComponent: bestDelegate(type)
  }

  Rectangle
  {
    id: separator
    width: parent.width; height: 1; color: "#cccccc"
    anchors.bottom: parent.bottom
  }
  MouseArea
  {
      anchors.fill: parent
      onClicked:
      {
          console.log("index=",index);
          if(dataBank.get(index).type !=="header")
          {
              dataBank.move(index,index+1,1);
          }
      }
  }
}
