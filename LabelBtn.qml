import QtQuick 2.0
import QtQuick 2.5
Rectangle {
    id:labelbtn
    property string picSrc: ""
    property string text:""
    property int index:0
    signal clicked(int btnIndex)
    property color bkColor: "#00FFFFFF"
    width:32
    height:50
    radius: 5
    Image
    {
        id: image
        source:labelbtn.picSrc
    }
    Text
    {
        id: label
        color: "#000000"
        font.pointSize: 9
        font.family: "微软雅黑"
        anchors.horizontalCenter: image.horizontalCenter
        anchors.top: image.bottom
        anchors.topMargin: 3
        text:labelbtn.text
    }

    MouseArea//鼠标响应消息区域
    {
        hoverEnabled: true
        anchors.fill: parent
        onEntered:labelbtn.state == 'checked' ? labelbtn.state = 'checked' : labelbtn.state = 'hover'
        onExited:labelbtn.state == 'checked' ? labelbtn.state = 'checked' : labelbtn.state = 'leave'
        onPressed:
        {
            labelbtn.state = 'checked'
            labelbtn.clicked(labelbtn.index)
        }
    }

    states:
    [
        State {
            name: "checked"
            PropertyChanges { target: labelbtn; bkColor:"#77FFFFFF" }
        },

        State {
            name: "hover"
            PropertyChanges { target: labelbtn; bkColor:"#77FFFFFF" }
        },

        State {
            name: "leave"
            PropertyChanges { target: labelbtn; bkColor:"#00FFFFFF" }
        }
    ]

    transitions:
    [
        Transition
        {
            PropertyAnimation
            {
                property:"bkColor"
                easing.type: Easing.Linear
                duration: 200
            }
        }
    ]
}
