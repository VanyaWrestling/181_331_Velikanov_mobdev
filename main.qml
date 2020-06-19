import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14
import QtWebView 1.14
//import QtCharts 2.3



ApplicationWindow {
    signal makeRequest()
    signal restRequest();
    signal hashMD5(string pop);
    signal token(string add);
    signal db_read();
    signal db_write();

    id:appw  // window
    visible: true
    width: 600
    height: 800
//    width: 480
//    height: 640
    title: qsTr("VelikanApp")
    Material.theme: Material.Light
    Material.accent: Material.Indigo
    //    header: Rectangle{
    //        width: maximumWidth; height: 55
    //        color: Material.color(Material.Indigo)

    //    }



//    Connections{
//        target: httpcontroller
//        function onToQML2(pString){
//            txa42.append(pString);
//        }
//    }


    //    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
       // currentIndex: 4
       // currentIndex: tabBar.currentIndex

        Lab1 {
            id: page1
        }

        Lab2 {
            id: page2
        }

        //}
        Lab3 {
            id: page3
        }
 /*       Page{
            GridLayout{
                anchors.fill: parent


                RowLayout{

                    RectangularGlow {
                        id: effect
                        anchors.fill: img2
                        glowRadius: sl1.value * 100
                        spread: 0.2
                        color: "blue"
                        cornerRadius: glowRadius
                    }
                    Image{
                        id: img2
                        source: "qrc:/image.png"
                        fillMode: Image.PreserveAspectFit

                    }


                    //                    Rectangle {
                    //                        id: rect
                    //                        color: "black"
                    //                        anchors.centerIn: parent
                    //                        width: Math.round(parent.width / 1.5)
                    //                        height: Math.round(parent.height / 2)
                    //                        radius: 0
                    //                    }
                    Slider{
                        id:sl1
                        to: 1
                        value: 0.5
                        from: 0

                    }

                }
            }
        }
        Page{
            RowLayout{
                Layout.fillWidth: true
                Layout.row: 3
                Layout.column: 0
                Layout.columnSpan: 2
                Rectangle{ // картинка
                    id: rec
                    width: 200
                    height: 150
                    color: "teal"
                    //source: "qrc:/image.png" // картинка к которой применяется эффект
                 //   visible: false
                }
//                MaskedBlur { // эффект размытия градиентом
//                    Layout.preferredHeight: image.height
//                    Layout.preferredWidth: image.width
//                    source: image
//                    maskSource: linearGradient
//                    radius: sliderMasked.position*50 // зависисимость степени размытия от позиции слайдера
//                    samples: 25
//                    Layout.alignment: Qt.AlignCenter
//                }
                LinearGradient { // линейный градиент
                    anchors.fill: rec
                    id: linearGradient
                    Layout.preferredHeight: 100
                    Layout.preferredWidth: 100
                    //opacity: 0.0
                    source: Image{
                        id: image
                        source: "qrc:/eagle.png" // это сама масkа которая применяется
                    }
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "white" }
                        GradientStop { position: 1.0; color: "red" }
                    }
                    start: Qt.point(0, 0) // эффект до середины картинки
                    end: Qt.point(image.width, image.height * sliderMasked.value)
                    //visible: false
                }
            }
            RowLayout{
                Layout.fillWidth: true
                Layout.row: 3
                Layout.column: 1
                Layout.columnSpan: 2
                Slider{ // слайдер
                    id: sliderMasked
                    from: 0.0
                    to: 1.0
                }
            }
        }
*/
        Lab4 {
            id: page4
        }
        Lab5 {
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
                    anchors.horizontalCenter: parent.horizontalCenter
                   // Layout.row:3
                   // Layout.alignment: Qt.AlignCenter
                    onClicked:{
                        //                     success(final_ac.text);
                        //webView.goBack();
                               restRequest();
                    }
                }
//                Button {
//                                        id: buttonvivodne

//                                        visible: true

//                                        contentItem: Text {
//                                            horizontalAlignment: Text.AlignHCenter
//                                            verticalAlignment: Text.AlignVCenter
//                                            text: qsTr("<b>обновить<b>")
//                                            font.pixelSize: 15
//                                            color: "white"
//                                        }

//                                        background: Rectangle {
//                                            implicitWidth: 80 //абсолютная щирина
//                                            implicitHeight: 35
//                                            color: buttonvivodne.down ? "#079d4d" : "green" //смена цвета при нажатии
//                                            radius: 10
//                                        }

//                                        onClicked: {
//                                            //buttonvivodne.visible = false
//                                            var token = httpcontroller.token(brow51.url);
//                                            if (token !== " ") {

//                                                db_write();
//                                                db_read();
//                                                label123.visible = false
//                                            } else{

//                                            swipeView.currentIndex = 4
//                                            //labelpliz.visible = true
//                                            //label123.visible = false
//                                            }

//                                        }
//                                    }
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
                        Layout.preferredWidth: 520
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
                        Layout.preferredWidth: 520
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
                //property string id: brow51

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
        Lab6 {
            id: page6

            header:
                ToolBar{
                anchors.top: parent.top
                background: Rectangle{
                    implicitHeight: 50
                    width: parent.width
                    Image{
                        id:hmg43
                        source: ""
                        anchors.right: txt4.left
                        anchors.rightMargin: 6
                        width: 100
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Text {
                        id: txt43
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 16
                        font.family: "Helvetica"
                        font.italic: true
                        color: "#ffffff"
                        text: "Rest API"

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
        //    background: Image {
        //        id: backgroundKhabib
        //        source: "qrc:/Khabib.jpg"
        //    }

                ScrollView{
                anchors.fill: parent
                Image{
                    id: background
                    source: "qrc:/resources/nebo.jpg"
                    width: parent.width
                    height: parent.height*2
                    sourceSize.width: -1
                    fillMode: Image.TileHorizontally
                    y: -grid.contentY / 3 | -list.contentY / 3
                }


            ColumnLayout{

                anchors.fill: parent
               // Layout.alignment: Qt.AlignHCenter

            RowLayout{
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                RadioButton{ // выбор, что отображается на страничке
                    id: rad_1 // id
                    //Layout.alignment: Qt.AlignLeft
                    text: "Столбцы" // подпись
                    checked: true // выбран по умолчанию
                    onCheckedChanged: // если сменен выбор
                        if(rad_1.checked === true){ // если выбран rad1
                            grid.visible = true
                            list.visible = false
                        }
                }
                RadioButton{ // выбор, что отображается на страничке
                    id: rad_2 // id
                    //Layout.alignment: Qt.AlignRight
                    text: "Строки" // подпись
                    checked: false
                    onCheckedChanged: // если вменен выбор
                        if(rad_2.checked === true){ // если выбран rad2
                            list.visible = true // видео не отображается
                            grid.visible = false // слайдер не отображается
                        }
                }
            }

            Button {
                                    id: buttonvivodne2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    visible: true
                                    Material.background: Material.Amber
                                    contentItem: Text {
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        text: qsTr("Обновить")
                                        font.pixelSize: 15
                                        color: "indigo"
                                        font.bold: true
                                       // Material.foreground:  Material.Indigo
                                    }

//                                    background: Rectangle {
//                                        implicitWidth: 80 //абсолютная щирина
//                                        implicitHeight: 35
//                                        color: buttonvivodne2.down ? "#079d4d" : "green" //смена цвета при нажатии
//                                        radius: 10
//                                    }

                                    onClicked: {
                                        //buttonvivodne.visible = false
                                        var token =   httpcontroller.token(brow51.url);
                                        var sig = httpcontroller.hashMD5(brow51.url);
                                        if (token !== " " && sig !== " ") {

                                            db_write();
                                            db_read();
                                            //label123.visible = false
                                        } else{

                                        swipeView.currentIndex = 4
                                       // labelpliz.visible = true
                                        //label123.visible = false
                                        }

                                    }
                                }
//            Label {
//                id: label123
//                 //objectName: "label123"

//                Layout.alignment: Qt.AlignCenter
//                visible: true
//                font.pixelSize: 17
//                font.bold: true
//                text: "В бд нет данных, нажмите кнопку обновить"

//            }


                GridView{
                    id: grid
                    visible: true
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    enabled: true
                    clip: true
                    anchors.margins: 10
                    cellHeight: 150
                    cellWidth: 300

                    model: mail_model

                    //spacing: 10

                    delegate: Item {
                        height: grid.cellHeight
                        width: grid.cellWidth

                        Rectangle{
                        color: "#57bfff"
                        anchors.fill: parent
        //                height: grid.cellHeight
        //                width: grid.cellWidth
                        border.color: "#2baeff"
                        anchors.margins: 5
                        border.width: 2
                        radius: 10
                        GridLayout{
                            anchors.fill: parent
                            columns: 3
                            rows: 4
                            //anchors.margins: 10
                            //Layout.margins: 20
                            Image{
                                source: pic50x50
                                Layout.column: 0
                                Layout.row: 0
                                Layout.rowSpan: 4
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                Layout.margins: 5
                                fillMode: Image.PreserveAspectFit
                            }
                            Label{ // заголовок
                                color: "black"
                                text: user_id
                                Layout.column: 1
                                Layout.row: 1
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.margins: 20
                            }
                            Label{ // Описание
                                color: "black"
                                text: textt
                                Layout.column: 1
                                Layout.row: 2
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.margins: 20
                            }
                            Label{ // size
                                color: "black"
                                text: "Размер: " + comments_count +" Б"
                                Layout.column: 1
                                Layout.row: 3
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.margins: 20
                            }
                        }
                    }
                }
                }

                ListView{
                    id: list
                    visible: false
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    enabled: true
                    model: mail_model
                    spacing: 20
                    clip: true
                    anchors.margins: 10

                    delegate: Rectangle{
                        color: "#57bfff"
                        width: list.width
                        height: 100
                        border.color: "#2baeff"
                        Layout.margins: 10
                        radius: 7
                        GridLayout{
                            anchors.fill: parent
                            columns: 3
                            rows: 3
                            //Layout.margins: 20
                            Image{
                                source: pic50x50
                                Layout.column: 0
                                Layout.row: 0
                                Layout.rowSpan: 3
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                Layout.margins: 5
                                fillMode: Image.PreserveAspectFit
                            }
                            Label{ // Заголовок
                                color: "black"
                                text: user_id
                                Layout.column: 1
                                Layout.row: 1
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.margins: 20
                            }
                            Label{ //Описание
                                color: "black"
                                text: textt
                                Layout.column: 1
                                Layout.row: 2
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.margins: 20
                            }
                            Label{ // Размер
                                color: "black"
                                text: "Размер: " + comments_count + " Б"
                                Layout.column: 2
                                Layout.row: 1
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                //Layout.margins: 20
                            }
                        }
                    }
                }
            }
            }
        }
        Lab7 {
            id: page7
        }
        Lab9 {
            id: page9
        }
        Page10 {
            id: page10
        }
    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex


//        TabButton {
//            text: qsTr("Lab 1")

//        }
//        TabButton {
//            text: qsTr("Page 2")
//        }
//        TabButton {
//            text: qsTr("Page 3")
//        }
//        TabButton{
//            text: qsTr("Page 4")
//        }
//        TabButton{
//            text: qsTr("Page 5")
//        }
//    }
    Drawer{
        id: dr1
        width: parent.width * 0.5
        height: parent.height
        dragMargin: 50
        GridLayout{
            rows: 16
            columns: 1
            rowSpacing: 16
            anchors.fill: parent
            Button{
                text: "Lab 1"
                Layout.row: 0
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 0;
                    dr1.close();
                }
            }
            Button{
                text: "Lab 2"
                Layout.row: 1
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 1;
                    dr1.close();
                }
            }
            Button{
                text: "Lab 3"
                Layout.row: 2
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 2;
                    dr1.close();
                }
            }
            Button{
                text: "Lab 4"
                Layout.row: 3
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 3;
                    dr1.close();
                }
            }
            Button{
                text: "Lab 5"
                Layout.row: 4
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 4;
                    dr1.close();
                }
            }
            Button{
                text: "Lab 6"
                Layout.row: 5
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 5;
                    dr1.close();
                }

            }
            Button{
                text: "Lab 7"
                Layout.row: 6
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 6;
                    dr1.close();
                }

            }
            Button{
                text: "Lab 9"
                Layout.row: 7
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 7;
                    dr1.close();
                }

            }
            Button{
                text: "Lab 10"
                Layout.row: 8
                Layout.column: 0
                Layout.columnSpan: 1
                Layout.fillWidth: true
                Material.background: Material.Amber
                Material.foreground: Material.Indigo
                onClicked: {
                    swipeView.currentIndex = 8;
                    dr1.close();
                }

            }
        }
    }
}

