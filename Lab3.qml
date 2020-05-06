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
    GridLayout{
        anchors.fill: parent
        columns: 2
        
        
        
        Image {
            id: img1lb3
            source: "qrc:/image.png"
            visible: true
        }
        
        Slider{
            id: sliderimg1
            from: 0
            value: 0
            to: 1
            Text {
                id: colorizeText
                text: qsTr("Colorize")
                color: "red"
                
                font{
                    pixelSize: 20
                    
                }
            }
            
        }
        
        Image {
            id: img2lb3
            source: "qrc:/image.png"
            
            fillMode: Image.PreserveAspectFit
        }
        Slider{
            id: sliderimg2
            from: 0
            value: 0
            to: 1
        }
        
        Image {
            id: img3lb3
            source: "qrc:/image.png"
            visible: true
        }
        Slider{
            id: sliderimg3
        }
        
        Colorize{
            id: effect2
            anchors.fill: img1lb3
            source: img1lb3
            hue: 0.0
            saturation: sliderimg1.value
            lightness: -0.2
            
        }
        RectangularGlow {
            id: effect1
            anchors.fill: img2lb3
            glowRadius: sliderimg2.value * 100
            spread: 0.2
            color: "blue"
            cornerRadius: glowRadius
        }
        
        
        
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
