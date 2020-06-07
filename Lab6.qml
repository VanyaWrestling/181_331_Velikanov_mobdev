import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14



Page{
    id: page6
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
        Layout.alignment: Qt.AlignHCenter

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


        GridView{
            id: grid
            visible: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            enabled: true
            cellHeight: 200
            cellWidth: 280

            model: mail_model

            //spacing: 10

            delegate: Rectangle{
                color: "white"
                width: 280
                height: 200
                border.color: "grey"
                Layout.margins: 5
                border.width: 2
                radius: 10
                GridLayout{
                    anchors.fill: parent
                    columns: 3
                    rows: 4
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

        ListView{
            id: list
            visible: false
            Layout.fillHeight: true
            Layout.fillWidth: true
            enabled: true
            model: mail_model
            spacing: 30

            delegate: Rectangle{
                color: "white"
                width: parent.width
                height: 100
                border.color: "grey"
                Layout.margins: 10
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
