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
    Connections{
        target: httpcontroller
        function onToQML91(more,less, between){
            //rcterr91.visible = false;
            //crt91.visible = true;
            crb91.values = [more];
            crb92.values = [less];
            crb93.values = [between]

           if(more>less){bvl91.max = more /* + bvl91.tickCount*/;}
           else if(less>more){bvl91.max = less /* + bvl91.tickCount*/;}
           else {bvl91.max = between}
        }
    }
    ChartView{
        id: crt91
        anchors.fill: parent
        title: "Хабиб Нурмагомедов vs Konor McGregor"
        legend.alignment: Qt.AlignBottom
        antialiasing: true
        BarSeries{ //данные (пары X-Y)

            axisX: BarCategoryAxis { categories: ["Current"]/*; titleFont.family: "Arial"; titleFont.italic: true; titleFont.pointSize: 12*/ }
           // axisY: bvl91
            axisY: ValueAxis{id: bvl91; min: 0; /* tickCount: 2; titleFont.family: "Arial"; titleFont.italic: true; titleFont.pointSize: 12*/ }
            BarSet{
                 id: crb91;
                label: "Меньше 50 Кб";
               // values: [1]
                //values: [Qt.point(0, 5), Qt.point(2, 1), Qt.point(3, 5)]
            }
            BarSet{
                id: crb92;
                label: "Больше 80 Кб";
               // values: [1]
                color: "red"
            }
            BarSet{
                id: crb93;
                label: "Между";
                //values: [1]
            }


        }
        //axisX: BarCategoryAxis { categories: ["Current"]/*; titleFont.family: "Arial"; titleFont.italic: true; titleFont.pointSize: 12*/ }
       // axisY: ValueAxis{id: bvl91; min: 0; tickCount: 5/*; titleFont.family: "Arial"; titleFont.italic: true; titleFont.pointSize: 12*/ }
        //ValueAxis - ось непрерывных величин
//        BarCategoryAxis{ // горизонтальная ось
//            id: xAxis
//        }
//        ValueAxis{ // вертикальная числовая ось
//            id: yAxis
//        }


       }

    }



