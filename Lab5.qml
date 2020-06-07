import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtGraphicalEffects 1.14
import QtWebView 1.14

Page {//ЛР5
    id: page5
    header:
        ToolBar{
        anchors.top: parent.top
        background: Rectangle{
            implicitHeight: 50
            width: parent.width
            Image{
                id:hmg4
                source: ""
                anchors.right: txt4.left
                anchors.rightMargin: 6
                width: 100
                height: 50
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: txt4
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 16
                font.family: "Helvetica"
                font.italic: true
                color: "#ffffff"
                text: "OAuth 2"

            }
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#3F51B5" }
                GradientStop { position: 0.25; color: "#9C27B0" }
                GradientStop { position: 0.5; color: "#E91E63" }
                GradientStop { position: 0.75; color: "#FF9800" }
                GradientStop { position: 1.0; color: "#FFEB3B" }
            }
        }
    }
    //Лабораторная 5: Аутентификация OAuth2 в мобильном приложении
    Connections{
        target: httpcontroller
        function onToQML3(str1, str2){
            brow51.visible = false;
            rct51.visible = true;
            ll51.visible = false;
            txt513.text = str1;
            txt515.text = str2;
        }
    }
    Connections{
        target: httpcontroller
        function onToQML4(){
            brow51.visible = false;
            rct52.visible = true;
            ll51.visible = false;
        }
    }
    Label{
        id: ll51
        height: parent.height* 0.2
        width: parent.width * 0.9
        font.pointSize: 10
        anchors.margins: 15
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        wrapMode: TextArea.Wrap
    }
    Rectangle{
        id: rct51
        visible: false
        width: parent.width
        height: parent.height*0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: ll51.top
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 50
        color: "lightgreen"
        Text {
            id: txt511
            font.pointSize: 18
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            text: "Доступ получен!"
        }
        Text {
            id: txt512
            font.pointSize: 16
            width: 30
            anchors.left: parent.left
            anchors.top: txt511.bottom
            anchors.leftMargin: 15
            anchors.topMargin: 15
            text: "URL: "
        }
        Text{
            id: txt513
            font.pointSize: 10
            width: parent.width*0.9
            height: 70
            wrapMode: TextArea.Wrap
            anchors.left: parent.left
            anchors.top: txt512.bottom
            anchors.leftMargin: 15
            anchors.topMargin: 15
        }
        Text {
            id: txt514
            font.pointSize: 16
            width: 70
            anchors.left: parent.left
            anchors.top: txt513.bottom
            anchors.leftMargin: 15
            anchors.topMargin: 40
            text: "Token: "
        }
        Text {
            id: txt515
            font.pointSize: 10
            width: parent.width*0.9
            height: 50
            wrapMode: TextArea.Wrap
            anchors.left: parent.left
            anchors.top: txt514.bottom
            anchors.leftMargin: 15
            anchors.topMargin: 15
        }
        Button{
            visible: true
            id:mailButton
            font.pixelSize: 13
            text: "Фото"
            Material.background: Material.Amber
            Material.foreground: Material.Indigo
            anchors.top: txt515.bottom
           // Layout.row:3
           // Layout.alignment: Qt.AlignCenter
            onClicked:{
                //                     success(final_ac.text);
                //webView.goBack();
                       restRequest();
            }
        }
    }

    Rectangle{
        id: rct52
        visible: false
        width: parent.width
        height: parent.height*0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: ll51.top
        color: "#EA0101"
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 50
        Text {
            id: txt52
            font.pointSize: 18
            text: "Что то пошло не так!"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        Button{
            id: btn52
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 15
            text: "Попробуй еще"
            font.pointSize: 16
            Material.background: Material.Amber
            Material.foreground: Material.Indigo
            onClicked:
            {
                rct52.visible = false;
                rct53.visible = false;
                brow51.visible = true;
                brow.url = "https://connect.mail.ru/oauth/authorize?"
                        + "client_id=779246&"
                        + "response_type=token&"
                        + "redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html";




                        //видимость браузера
                        //brow51.url = "https://github.com/login/oauth/authorize" //первый url аутентификации
                      //  + "?client_id=543262d9f54897a5e31b"
                       // + "&redirect_uri=https://oauth.github.com"
                       // + "&display=mobile"
                       // + "&scope="
                      //  + "&response_type=token"
                       // + "&v=5.37"
                      //  + "&state=123456"
                     //   + "&allow_signup=true";
//                brow51.url = "https://oauth.vk.com/authorize" //первый url аутентификации
//                        + "?client_id=7444825"
//                        + "&redirect_uri=https://oauth.vk.com/blank.html"
//                        + "&display=mobile"
//                        + "&scope=friends"
//                        + "&response_type=token"
//                        + "&v=5.37"
//                        + "&state=123456";
            }

        }
    }
    Rectangle{
        id: rct53
        visible: if(rct51.visible == true){rct53.visible = false}
        width: parent.width
        height: parent.height*0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: ll51.top
        color: "#fff"
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 50
        ColumnLayout{

            TextField{
                placeholderText: qsTr("Логин")

                font{
                    pixelSize: 20

                }
                 Material.foreground: Material.Indigo
                Layout.alignment: Qt.AlignCenter
                Layout.margins: 20
                // Layout.leftMargin: 50
                Layout.preferredWidth: 370
                Layout.preferredHeight: 50
            }

            TextField{
                Material.foreground: Material.Indigo
                Layout.alignment: Qt.AlignCenter
                Layout.margins: 20
                placeholderText: qsTr("Пароль")
                font{
                    pixelSize: 20
                }
                echoMode: TextInput.Password
                // Layout.leftMargin: 50
                Layout.preferredWidth: 370
                Layout.preferredHeight: 50
            }
            Button{
            id: btn53
            //anchors.bottom: parent.bottom
           // anchors.horizontalCenter: parent.horizontalCenter
            //anchors.top: tf52.bottom
            Layout.alignment: Qt.AlignCenter
            Material.background: Material.Blue
            Material.foreground: Material.Amber
            text: "Войти через Mail.ru"
            onClicked:
            {
                rct53.visible = false;
                brow51.visible = true;
            }

        }
        }

    }

    WebView
    {
        id:brow51
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: ll51.top
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.bottomMargin: 50
        width: parent.width
        height: parent.height*0.5
        visible: false
        //url: "https://oauth.vk.com/authorize?client_id=7444825&redirect_uri=https://oauth.vk.com/blank.html&display=mobile&scope=friends&response_type=token&v=5.37&state=123456"
        //url: "https://connect.mail.ru/oauth/authorize?client_id=772344&response_type=token&redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html"
        // url: "https://github.com/login/oauth/authorize?client_id=543262d9f54897a5e31b&scope=&response_type=token&state=123456&allow_signup=true"
         url: "https://connect.mail.ru/oauth/authorize?client_id=779246&response_type=token&redirect_uri=http%3A%2F%2Fconnect.mail.ru%2Foauth%2Fsuccess.html&scope=messages"
        onLoadingChanged: {
            ll51.text = brow51.url;
            httpcontroller.token(brow51.url);
            httpcontroller.hashMD5(brow51.url);
            //                    if(loadRequest===WebView.LoadStartedStatus) {}
            //                    else if(loadRequest===WebView.LoadSucceededStatus) console.info ("***" + brow51.url)
            //                    else if(loadRequest===WebView.LoadFailedStatus) console.error ("***" + brow51.url)
        }
    }
}
