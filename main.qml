import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14
//import QtCharts 2.3



ApplicationWindow {
    signal makeRequest()
    signal restRequest();
    signal hashMD5(string pop);
    signal token(string add);
    id:appw  // window
    visible: true
    width: 480
    height: 640
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
        }
        Lab6 {
            id: page6
        }
        Lab7 {
            id: page7
        }
        Lab9 {
            id: page9
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
            rows: 14
            columns: 1
            rowSpacing: 14
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
        }
    }
}

