import QtQuick
import QtQuick.Effects

Window {
    width: 900
    height: 600
    visible: true
    title: qsTr("Scoreboard")
    color: "black"
    x: 200
    y: 200


    FontLoader { id: fontv; source: "./fonts/Manrope.ttf"; }


    MouseArea {
        x: 100
        y: 100
        height: 50
        width: 100

        onClicked: {
            anim.start()

            //kkk.start()
            //hhh.children["kkk"].start();
            qae.state = "OFF"
            //modelv.setData(modelv.index(0, 0), "Россия", 257)
        }

        Rectangle {
            x: 0
            y: 0
            width: 100
            height: 50
            color: "blue"
            clip: true
            Text {

                text: "Старт"
                font.pixelSize: 20
                color: 'white'
                anchors.centerIn: parent
            }
        }
    }
    MouseArea {
        x: 300
        y: 100
        height: 50
        width: 100

        onClicked: {
            anim.start()

            //kkk.start()
            //hhh.children["kkk"].start();
            qae.state = "ON"
            //modelv.setData(modelv.index(0, 0), "Russia", 257)
        }

        Rectangle {
            x: 0
            y: 0
            width: 100
            height: 50
            color: "blue"
            clip: true
            Text {

                text: "Стоп"
                font.pixelSize: 20
                color: 'white'
                anchors.centerIn: parent
            }
        }
    }
    MouseArea {
        x: 500
        y: 100
        height: 50
        width: 100

        onClicked: {
            //anim.start()

            //kkk.start()
            //hhh.children["kkk"].start();
            qae.state = "ON"
            //actorv.start();
            actorv.juryReveal();
        }

        Rectangle {
            x: 0
            y: 0
            width: 100
            height: 50
            color: "blue"
            clip: true
            Text {

                text: "Edit"
                font.pixelSize: 20
                color: 'white'
                anchors.centerIn: parent
            }
        }
    }

    Row {
        //visible: false
        Rectangle {
            x: 0
            y: 0
            width: 50
            height: 50
            color: "blue"
            clip: true

            Rectangle {
                id: txt
                x: 0
                y: 0
                width: 50
                height: 50
                color: "transparent"
                PropertyAnimation {
                    id: anim
                    target: txt
                    properties: "y"
                    from: 100
                    to: 0
                    duration: 200
                    easing.type: Easing.InOutCubic
                }

                Text {

                    text: "80"
                    font.pixelSize: 22
                    color: 'white'
                    anchors.centerIn: parent
                }
            }
        }
    }

    JuryPanel{
        id: qae
        x: 0
        y: 250
        model: modelj
        //visible: (actorv.giveMarksP && !actorv.giveHighMarkP) ? false : true
        state: (!actorv.giveMarksP && !actorv.giveHighMarkP) ? "ON" : "OFF"
    }

    Scoreboard {
        x: 350
        y: 250
        model: modelv
        //visible: (!actorv.giveMarksP && !actorv.giveHighMarkP) ? false : true
        state: (actorv.giveMarksP && !actorv.giveHighMarkP) ? "OFF" : "ON"
    }


}
