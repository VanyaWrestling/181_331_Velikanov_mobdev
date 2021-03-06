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
    id: page4
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
                text: "Запрос по HTTP"

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
    //Лабораторная 4: Запросы к серверу по протоколу HTTP
    Connections{
        target: httpcontroller
        function onToQML(pString, nString){
            textArea.append(pString);
            textFieldNumber.text = nString;
        }
    }
    
    
    Flickable{
        id: flic41
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.7
        width: parent.width * 0.9
        anchors.margins: 15
        TextArea.flickable: TextArea{
            // objectName: "textArea"
            id: textArea
            //textFormat: Text.RichText
            readOnly: true
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.7
            width: parent.width
            font.pointSize: 10
            anchors.margins: 15
            
        }
        ScrollBar.vertical: ScrollBar{}
        ScrollBar.horizontal: ScrollBar{}
    }
    
    
    Button{
        width: 200
        height: 50
        anchors.top: flic41.bottom
        anchors.left: parent.left
        anchors.margins: 15
        highlighted:  true
        Material.accent: Material.Amber
        Text{
            text: "Сделать запрос"
            color: "white"
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
//        background: Rectangle{
//            width: parent.width
//            height: parent.height
//            gradient: Gradient {
//                GradientStop { position: 0.0; color: "#666666" }
//                GradientStop { position: 0.125; color: "#555555" }
//                GradientStop { position: 0.25; color: "#444444" }
//                GradientStop { position: 0.375; color: "#333333" }
//                GradientStop { position: 0.5; color: "#222222" }
//                GradientStop { position: 0.625; color: "#333333" }
//                GradientStop { position: 0.75; color: "#444444" }
//                GradientStop { position: 0.875; color: "#555555" }
//                GradientStop { position: 1.0; color: "#666666" }
//            }
//        }
        onClicked: {
            makeRequest();
        }
    }
    
    TextField{
        //objectName: "textFieldDate"
        id: textFieldNumber
        readOnly: true
        font.pointSize: 16
        width: parent.width*0.25
        implicitHeight: 50
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 15

    }
    
    Text{
        id: txt41
        color: "black"
        font.pointSize: 16
        anchors.right: textFieldNumber.left
        anchors.bottom: parent.bottom
        //anchors.topMargin: 25
        //anchors.rightMargin: 15
        anchors.margins: 15
        text: "Курс доллара $:  "
    }
    
}
