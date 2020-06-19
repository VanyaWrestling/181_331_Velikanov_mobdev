import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14



Page { //3 Laba
    id: page3
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
                font.bold: true
                color: "#ffffff"
                text: "Фильтры"

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
    GridLayout{
        anchors.fill: parent
        columns: 2
        
        
        
        Image {
            Layout.topMargin: 20
            id: img1lb3
            source: "qrc:/image.png"
            visible: true

            Layout.fillHeight: true
            Layout.fillWidth: true
            fillMode: Image.PreserveAspectFit
        }
        Item {
            width: img1lb3.width
           // height: 200
            height: img1lb3.height
            Layout.fillHeight: true
            Layout.fillWidth: true
            ColumnLayout{
                anchors.fill: parent
                Layout.fillWidth: true
                Layout.fillHeight: true


        Slider{
            id: sliderimg1
            from: 0
            value: 0
            to: 1
            Text {
                Layout.alignment: parent.AlignCenter
                id: colorizeText
                text: qsTr("           Colorize sut")
                color: "Indigo"
                
                font{
                    pixelSize: 20
                    
                }
            }
            
        }
        Slider{
            id: sliderimg12
            from: 0
            value: 0
            to: 1
            Text {
                Layout.alignment: parent.AlignCenter
                id: colorizeText2
                text: qsTr("           Colorize hue")
                color: "Indigo"

                font{
                    pixelSize: 20

                }
            }

        }
        Slider{
            id: sliderimg13
            from: 0
            value: 0
            to: 1
            Text {
                Layout.alignment: parent.AlignCenter
                id: colorizeText3
                text: qsTr("           Colorize lightn")
                color: "Indigo"

                font{
                    pixelSize: 20

                }
            }

        }
      }
    }


        
        //        Image {
        //            id: img2lb3
        //            source: "qrc:/image.png"

        //            fillMode: Image.PreserveAspectFit
        //        }

        Item {
//            width: 150
//            height: 150
            height: rect.height
            width: rect.width

            Layout.alignment: Qt.AlignCenter

            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.leftMargin: 20
            Layout.topMargin: 20
            RectangularGlow {
                id: effect
                anchors.fill: rect
                glowRadius: 100 * sliderimg2.value
                spread: 0.2
                color: "indigo"
                cornerRadius: rect.radius + glowRadius
            }

            Rectangle {
                id: rect
                color: "black"
                //                anchors.centerIn: parent
//                width: 100
//                height: 100
                width: Math.round(parent.width )
                height: Math.round(parent.height )
                radius: 25

            }
        }
        Slider{
            id: sliderimg2
            from: 0
            value: 0.5
            to: 1
            Text {
                Layout.alignment: parent.AlignCenter
                id: rectglowtext
                text: qsTr("      RectangularGlow")
                color: "Indigo"

                font{
                    pixelSize: 20

                }
            }
        }
        Item{
//            width: 220
//            height: 220
            width: rec.width
            height: rec.height
            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignCenter
         //   Layout.fillHeight: true
            Layout.leftMargin: 20
            Layout.topMargin: 20
            Rectangle{ // картинка
                id: rec
               // width: 200
                //height: 150
                width: Math.round(parent.width)
                height: Math.round(parent.height * 3)
                color: "#FFC107"
                radius: 15
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
                    Layout.alignment: Qt.AlignCenter
                    fillMode: Image.PreserveAspectFit
                    id: image
                    source: "qrc:/eagle.png" // это сама масkа которая применяется
                }
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "lightblue" }
                    GradientStop { position: 1.0; color: "red" }
                }
                start: Qt.point(0, 0) // эффект до середины картинки
                end: Qt.point(image.width, image.height * sliderMasked.value)
                //visible: false
            }
        }

        Slider{ // слайдер
            id: sliderMasked
            from: 0.0
            to: 1.0

          //  anchors.verticalCenter: parent.verticalCenter
            Text {
                Layout.alignment: parent.AlignCenter
                id: lgText
                text: qsTr("      LinearGradient")
                color: "Indigo"

                font{
                    pixelSize: 20

                }
            }
        }

        //        Image {
        //            id: img3lb3
        //            source: "qrc:/image.png"
        //            visible: true
        //        }
        //        Slider{
        //            id: sliderimg3
        //        }
        
        Colorize{
            id: effect2
            anchors.fill: img1lb3
            source: img1lb3
            hue: sliderimg12.value
            saturation: sliderimg1.value
            lightness: sliderimg13.value
            cached: true

            
        }
        //        RectangularGlow {
        //            id: effect1
        //            anchors.fill: img2lb3
        //            glowRadius: sliderimg2.value * 100
        //            spread: 0.2
        //            color: "#f0ffffff"
        //            cornerRadius: glowRadius
        //        }
        
        
        
        //
        
    }
    
    //            RadioButton{
    //            id:rb1
    //            }
    //            RadioButton{
    //            anchors.left:rb1.right
    //            }
    //            TextField{
    //            id: tf
    //            anchors.top: rb1.bottom
    //            text:   "Vanya"
    //            background: Rectangle{
    //            color: "#886f6f"
    //            radius: 5
    //            implicitHeight: 35
    //            implicitWidth: 350
    //            border.color: "white"
    //            border.width: 1
    //            }
    
    //            }
    //            ComboBox{
    //            anchors.left: tf.right
    //             model: ["First", "Second", "Third"]
    
    
    
    //            }
    //            DelayButton{
    //            id:delbut
    //            text: "Progres"
    //            anchors.top: tf.bottom
    //            anchors.margins: 10
    //            width: 350
    //            anchors.horizontalCenter:  parent.horizontalCenter
    
    //            }
    //            Switch{
    //            id: sw
    //            anchors.top: delbut.bottom
    //            anchors.horizontalCenter: parent.horizontalCenter
    //            //anchors.verticalCenter: parent.verticalCenter
    //            //anchors.bottom: parent.bottom
    //            }
    //            Text {
    //                id: tx1
    //                text: qsTr("Hello Vanya")
    //                anchors.top: sw.bottom
    //                anchors.verticalCenter: parent.verticalCenter
    //                anchors.horizontalCenter: parent.horizontalCenter
    //                font{
    //                    bold:true
    //                    family: "Tahoma"
    //                    pixelSize: 16
    //                    italic: true
    
    //                }
    //            }
}
