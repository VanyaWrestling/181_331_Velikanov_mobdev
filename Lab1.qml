import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14



Page {
    id:page1
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
                width: 30
                height: 20
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
                text: "Lab 1"

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
    
    //1 Laba
    //            background: Rectangle{
    //                color: "#FFFFFF"
    
    
    
    
    
    GridLayout{
        
        
        //Layout.alignment: Qt.AlignCenter
        anchors.fill: parent
        columns: 1
        Text {
            id: name
            text: qsTr("Пожалуйста зарегистрируйтесь")
            font{
                pixelSize: 25
                italic: true
                
            }
            Layout.alignment: Qt.AlignCenter

            color: "Indigo"
            //Layout.alignment: Qt.AlignCenter
            //                                Layout.leftMargin: 50
            //                                Layout.topMargin: 30
        }
        TextField{
            placeholderText: qsTr("Логин")
            
            font{
                pixelSize: 20
                
            }
             Material.foreground: Material.Indigo
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 30
            // Layout.leftMargin: 50
            Layout.preferredWidth: 520
            Layout.preferredHeight: 50
        }
        
        TextField{
            Material.foreground: Material.Indigo
            Layout.alignment: Qt.AlignCenter
            placeholderText: qsTr("Пароль")
            font{
                pixelSize: 20
            }
            echoMode: TextInput.Password
            // Layout.leftMargin: 50
            Layout.preferredWidth: 520
            Layout.preferredHeight: 50
        }
        RadioButton{
            text: qsTr("М")
            //Layout.leftMargin: 50
             Layout.alignment: Qt.AlignCenter
        }
        
        RadioButton{
            text: qsTr("Ж")
            //Layout.leftMargin: 50
               Layout.alignment: Qt.AlignCenter
        }
        
        ComboBox{
            model: [ "Россия", "USA", "Japan" ]
             Layout.alignment: Qt.AlignCenter
            //Layout.leftMargin: 50
            Layout.preferredWidth: 520
            Layout.preferredHeight: 50
            font{
                pixelSize: 20
            }
            Material.background: Material.Amber
            Material.foreground: Material.Indigo
            
        }
        Switch{
            Layout.alignment: Qt.AlignCenter
            text: qsTr("Подтверждаю согласие на обработку персональных\nданных")
            font{
                pixelSize: 15
                //family: "Tahoma"
                
            }
            
            //Layout.leftMargin: 50
            
        }
        
        DelayButton{
            Layout.alignment: Qt.AlignCenter
            text: "Зарегистрироваться"
            font{
                pixelSize: 20
            }
            Material.background: Material.Amber
            Material.foreground: Material.Indigo
            Layout.preferredWidth: 520
            Layout.preferredHeight: 50
            // Layout.leftMargin: 50
            
            
            
        }
        
        //                Button {
        //                    text: "Test button"
        //                    palette {
        //                        button: "green"
        //                    }
        //                }
        
        
        
        
        
    }
    
    
    
}
