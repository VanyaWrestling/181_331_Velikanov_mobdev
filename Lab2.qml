import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14



Page { //2 Laba
    //            Material.theme: Material.Light
    //            Material.accent: Material.Red
    id:page2
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
                text: "Lab 2"

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
        columns: 3
        RadioButton {
            id:rb1
            checked: true
            Layout.row: 1
            Layout.alignment: Qt.AlignLeft
            text: qsTr("Видео")
            Layout.leftMargin: 150
            onClicked: {
                camera.stop();
            }
            
            
            
        }
        RadioButton {
            id: rb2
            Layout.row: 1
            // Layout.column: 2
            checked: false
            text: qsTr("Камера")
            Layout.leftMargin: 120
            Layout.alignment: Qt.AlignCenter
            onClicked: {
                camera.start();
            }
            
        }
        
        RowLayout{
            Layout.row: 2
            Text {
                //Layout.row: 2
                Layout.alignment: Qt.AlignCenter
                id: zvuk
                text: qsTr("Громкость звука:")
                Layout.leftMargin: 100
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
            width: 600
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
                Layout.leftMargin: 150
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
            width: 600
            height: 360
            
            Camera {
                id: camera
                captureMode: stop()
                imageCapture {
                    onImageCaptured: {
                        // Show the preview in an Image
                        photoPreview.source = preview
                    }
                }
            }
            
            VideoOutput {
                id:test
                source: camera
                focus : visible // to receive focus and capture key events when visible
                anchors.fill: parent
                
                MouseArea {
                    anchors.fill: parent;
                    onClicked: camera.imageCapture.capture()
                }
            }
            
            Image {
                anchors.top: test.bottom
                anchors.topMargin: 15
                width: 150
                height: 100
                id: photoPreview
                Layout.row: 3
            }
            
        }
        Button{
            visible: {if(rb2.checked){true}else{false}}
            Layout.row: 3
            onClicked:camera.imageCapture.captureToLocation("C:/Users/Ivan/Documents/Velikanov_Ivan_181-331_mob_dev/Lab1/photo")
            text: qsTr("Сделать фото")
            Layout.leftMargin: 250
            
        }
        //Camera
        
        
    }
    
    
    
}
