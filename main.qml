import QtQuick 2.5
import QtQml 2.2
import QtQuick.Window 2.2

Window {
    id:root1
    visible: true
    width: 360
    height: 720

    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.Window
    Loader{
        id:pageloader
    }

    Rectangle {
        id: container
        anchors.fill: parent
        radius: 10
        Image {
            id: backImage
            anchors.fill: parent

            source: "images/mainbk.jpg"
            Rectangle {
                id:adver//广告倒计时
                width: 40
                height: 40
                anchors.right: backImage.right
                anchors.rightMargin: 10
                anchors.top: backImage.top
                anchors.topMargin: 10
                radius: 20
                opacity: 0.8
                border.width: 1
                border.color: "#404040"
                color: "#fafafa"
                Text {
                    id: text1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 6
                    text: qsTr("广告")
                    font.pixelSize: 12
                    color: "green"
                }
                QtObject{
                    id:attr
                    property int counter;
                    Component.onCompleted: {
                        counter=5
                    }
                }

                Timer {
                    id:countdown
                    interval: 1000
                    running: true
                    repeat: true
                    triggeredOnStart: true
                    onTriggered:{
                        time.text=attr.counter+"s"
                        attr.counter-=1;
                        if(attr.counter<0)
                        {
                           // pageloader.source = "qrc:///FirstPage.qml"
                            var component = Qt.createComponent("FirstPage.qml");
                            if(component.status==Component.Ready)
                            {
                                var object =component.createObject(component.root);
                                root1.destroy();
                                countdown.stop();
                            }
                        }
                    }
                }
                Text {
                    id: time
                    font.pixelSize: 12
                    color: "green"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: text1.bottom
                    anchors.topMargin: 2

                }
            }

            Text {
                id: author
                font.bold: true
                font.pointSize: 36
                font.italic: true//斜体
                font.family: "华文行楷"
                color: "#a31c19"
                text: qsTr("虎扑体育")
                anchors.horizontalCenter: backImage.horizontalCenter
                anchors.bottom: backImage.bottom
                anchors.bottomMargin: 66
            }
            Text {
                id: describe
                font.pointSize: 16
                font.italic: true//斜体
                font.family: "华文仿宋"
                color: "#797778"
                text: qsTr("Proudly presented by HuPuJRs")
                anchors.horizontalCenter: backImage.horizontalCenter
                anchors.top: author.bottom
                anchors.topMargin: 6

            }
        }
    }
}
