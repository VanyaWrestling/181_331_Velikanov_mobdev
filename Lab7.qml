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
    id: page7
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
                text: "OpenSSL"

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

    ColumnLayout{
        anchors.fill: parent
        //columns: 2
       // rows: 2
        Text{
           text: "Введите ключ:"
          color: "indigo"
          font.pointSize: 20
          Layout.alignment: Qt.AlignCenter
        }

        TextField {
            id: cryptkey
//            Layout.row: 0
//            Layout.column: 0
//            Layout.columnSpan: 2
            Layout.fillWidth: true
            maximumLength: 32
            font.pointSize: 15

        }
        Button{
//            Layout.row: 1
//            Layout.column: 0
           // Layout.fillWidth: true
            text: qsTr("Зашифровать")
            Layout.alignment: Qt.AlignCenter
            Material.background: Material.Amber
            Material.foreground: Material.Indigo
            onClicked: if(cryptkey.length==32){test.encryption(cryptkey.text)}
        }
        Button{
//            Layout.row: 1
//            Layout.column: 1
           // Layout.fillWidth: true
            text: qsTr("Расшифровать")
            Layout.alignment: Qt.AlignCenter
            Material.background: Material.Amber
            Material.foreground: Material.Indigo
            onClicked: if(cryptkey.length==32){test.decryption(cryptkey.text)}
        }
        Text {
            id: keylen
            text: cryptkey.length
        }
    }
}
