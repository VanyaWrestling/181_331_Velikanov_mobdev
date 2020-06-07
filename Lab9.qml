import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14
import QtWinExtras 1.0 as Win
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.14
import QtCharts 2.3



Page{
    id: page9
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
                text: "Графики"

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

    ChartView{
        anchors.fill: parent
        title: "Хабиб Нурмагомедов vs Konor McGregor"
        legend.alignment: Qt.AlignBottom
        antialiasing: true
        BarSeries{ //данные (пары X-Y)
            axisX: xAxis
            axisY: yAxis
            BarSet{
                label: "Удары";
                values: [111,88]}
            BarSet{
                label: "Акцинт. удары";
                values: [99, 37]
                color: "red"
            }
            BarSet{
                label: "Тайкдауны";
                values: [4, 0]
            }


        }
        //ValueAxis - ось непрерывных величин
        BarCategoryAxis{ // горизонтальная ось
            id: xAxis
        }
        ValueAxis{ // вертикальная числовая ось
            id: yAxis
        }


       }

    }



