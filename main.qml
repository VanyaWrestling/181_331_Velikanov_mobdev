import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 480
    height: 640
    title: qsTr("Tabs")
    Material.theme: Material.Dark
    Material.accent: Material.Indigo
//    header: Rectangle{
//        width: maximumWidth; height: 55
//        color: Material.color(Material.Indigo)

//    }

//    Drawer {
//              id: drawer
//              width: 0.66 * window.width
//              height: window.height

//              Label {
//                  text: "Content goes here!"
//                  anchors.centerIn: parent
//              }
//          }



//    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
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

                                }
                                color: "Grey"
                                //Layout.alignment: Qt.AlignCenter
//                                Layout.leftMargin: 50
//                                Layout.topMargin: 30
                            }
                            TextField{
                                placeholderText: qsTr("Логин")

                                font{
                                    pixelSize: 20

                                }
                                Layout.alignment: Qt.AlignCenter
                                Layout.topMargin: 30
                               // Layout.leftMargin: 50
                                Layout.preferredWidth: 370
                                Layout.preferredHeight: 50
                            }

                            TextField{
                                Layout.alignment: Qt.AlignCenter
                                 placeholderText: qsTr("Пароль")
                                 font{
                                    pixelSize: 20
                                 }
                                 echoMode: TextInput.Password
                                // Layout.leftMargin: 50
                                 Layout.preferredWidth: 370
                                 Layout.preferredHeight: 50
                            }
                            RadioButton{
                                text: qsTr("М")
                                //Layout.leftMargin: 50
                               // Layout.alignment: Qt.AlignCenter
                            }

                            RadioButton{
                                text: qsTr("Ж")
                                //Layout.leftMargin: 50
                             //   Layout.alignment: Qt.AlignCenter
                            }

                            ComboBox{
                                 model: [ "Россия", "USA", "Japan" ]
                               //  Layout.alignment: Qt.AlignCenter
                                 //Layout.leftMargin: 50
                                 Layout.preferredWidth: 370
                                 Layout.preferredHeight: 50
                                 font{
                                    pixelSize: 20
                                 }

                            }
                            Switch{
                                //Layout.alignment: Qt.AlignCenter
                                text: qsTr("Подтверждаю согласие на обработку персональных\nданных")
                                font{
                                    pixelSize: 15
                                    //family: "Tahoma"

                                }

                                //Layout.leftMargin: 50

                            }

                            DelayButton{
                                //Layout.alignment: Qt.AlignCenter
                                text: "Зарегистрироваться"
                                font{
                                    pixelSize: 20
                                }

                                Layout.preferredWidth: 370
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

        Page2Form {
//            Material.theme: Material.Light
//            Material.accent: Material.Red

           GridLayout{
               anchors.fill: parent
               columns: 3
               RadioButton {
                        id:rb1
                        checked: true
                        Layout.row: 1
                        Layout.alignment: Qt.AlignLeft
                        text: qsTr("Видео")
                        Layout.leftMargin: 150



                    }
                    RadioButton {
                        id: rb2
                        Layout.row: 1
                       // Layout.column: 2
                        checked: false
                        text: qsTr("Камера")
                        Layout.leftMargin: 120
                        Layout.alignment: Qt.AlignCenter

                    }

                    RowLayout{
                        Layout.row: 2
                        Text {
                            //Layout.row: 2
                            Layout.alignment: Qt.AlignCenter
                            id: zvuk
                            text: qsTr("Громкость звука:")
                            Layout.leftMargin: 40
                            color: "Grey"
                            font{
                                pixelSize: 21

                            }
                            visible: {if(rb1.checked){true}else{false}}

                        }
                        Slider{

                          //  Layout.row: 3

                            value: 0.5
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignLeft
                            visible: {if(rb1.checked){true}else{false}}
                            id: volumeSlider
                            property real volume: QtMultimedia.convertVolume(volumeSlider.value,QtMultimedia.LogarithmicVolumeScale,QtMultimedia.LinearVolumeScale)


                        }
                    }
                    Rectangle {
                        visible: {if(rb1.checked){true}else{false}}
                        Layout.row: 3
                        width: 480
                        height: 300
                       // Layout.fillHeight: true
                        //Layout.fillWidth: true
                    MediaPlayer {
                        id: mediaplayer
                        volume: volumeSlider.volume
                        source: "qrc:/video/sample.mp4"
                       // source : url
                        onPositionChanged: {
                            sliderpl.sync = true
                            sliderpl.value = mediaplayer.position
                            sliderpl.sync = false
                        }
                    }

                    VideoOutput {
                        anchors.fill: parent
                        source: mediaplayer
                    }

//                    MouseArea {
//                        id: playArea2
//                        anchors.fill: parent
//                        onPressed: mediaplayer.play();
//                    }
                }


              RowLayout{
                  Layout.row: 4
//                  Button {
//                                  id: openButton

//                                  text: qsTr("...")
//                                  Layout.preferredWidth: openButton.implicitHeight
//                                  onClicked: fileDialog.open()

//                                  FileDialog {
//                                      id: fileDialog

//                                      folder : musicUrl
//                                      title: qsTr("Open file")
//                                      nameFilters: [qsTr("MP4 files (*.mp4)"), qsTr("All files (*.*)")]
//                                      onAccepted: mediaPlayer.source = fileDialog.fileUrl
//                                  }
//                              }
                  Slider   {
                       visible: {if(rb1.checked){true}else{false}}
                       id: sliderpl
                       width: parent.width
                       Layout.leftMargin: 100
                       to: mediaplayer.duraction //длительность
                       property bool sync: false
                       onValueChanged: {
                           if(!sync){
                               mediaplayer.seek(value)
                           }
                       }

                  }
                  Button{
                       visible: {if(rb1.checked){true}else{false}}
                       id: btn
                       enabled: mediaplayer.hasVideo
                       //Layout.preferredWidth: btn.implicitHeight
                       text: mediaplayer.playbackState === MediaPlayer.PlayingState ? "||" : "►"
                       onClicked: mediaplayer.playbackState === MediaPlayer.PlayingState ? mediaplayer.pause() : mediaplayer.play()
                     //  Layout.row: 6
                       Layout.leftMargin: 50
                  }
              }


               //Camera
               Item {
                    visible: {if(rb2.checked){true}else{false}}
                   Layout.row: 2
                    width: 480
                    height: 360

                    Camera {
                        id: camera

                        imageCapture {
                            onImageCaptured: {
                                // Show the preview in an Image
                                photoPreview.source = preview
                            }
                       }
                    }

                    VideoOutput {
                        source: camera
                        focus : visible // to receive focus and capture key events when visible
                        anchors.fill: parent

                        MouseArea {
                            anchors.fill: parent;
                            onClicked: camera.imageCapture.capture()
                        }
                    }

                   Image {

                        id: photoPreview
                        Layout.row: 3
                    }

                }
               Button{
                 visible: {if(rb2.checked){true}else{false}}
                 Layout.row: 3
                 onClicked:camera.imageCapture.captureToLocation("C:/Users/Ivan/Documents/Velikanov_Ivan_181-331_mob_dev/Lab1/photo")
                 text: qsTr("Сделать фото")
                 Layout.leftMargin: 170

               }
               //Camera


           }



        }

//}
        Page3Form{
           GridLayout{
               anchors.fill: parent
            Switch{
                id: switch2
            }

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
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex


        TabButton {
            text: qsTr("Lab 1")

        }
        TabButton {
            text: qsTr("Page 2")
        }
        TabButton {
            text: qsTr("Page 3")
        }
    }
}
