import QtQuick
import QtQuick.Effects

Window {
    width: 1200
    height: 800
    visible: true
    title: qsTr("Scoreboard")
    color: "black"
    x: 100
    y: 100



    FontLoader { id: fontv; source: "./fonts/Manrope.ttf"; }


    /*MouseArea {
        x: 100
        y: 100
        height: 50
        width: 100

        onClicked: {
            anim.start()

            //kkk.start()
            //hhh.children["kkk"].start();
            //qae.state = "OFF"
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
            //qae.state = "ON"
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
            //qae.state = "ON"
            //actorv.start();
            //actorv.juryReveal();
            //modelv.moveScore(2, 0);

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
    }*/

    Text {
       y:0
       text: "readyP = " + actorv.readyP + "\n" + "giveMarksP = " + actorv.giveMarksP + "\n" + "readyHighP = " + actorv.readyHighP + "\n" + "giveHighMarksP = " + actorv.giveHighMarkP + "\n"
        color: 'white'
    }



    JuryPanel{
        //id: qaef
        x: 350
        y: 50
        model: modelj
        //visible: getJuryVisible()
        juryState: getJuryState()

        function getJuryState()
        {
            if (!actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "ON"
            }
            else if (actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "ON"
            }
            else if (actorv.readyP && actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "OFF"
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "ON"
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && actorv.giveHighMarkP) {
                //visible = true;
                return "ON"
            }
            else {
                //visible = false;
                return "ON"
            }

        }

        function getJuryVisible()
        {
            if (!actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return false
            }
            else if (actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return false
            }
            else if (actorv.readyP && actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return true
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return false
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && actorv.giveHighMarkP) {
                //visible = true;
                return false
            }
            else {
                //visible = false;
                return false
            }
        }

        //state: (!actorv.giveMarksP && !actorv.giveHighMarkP) ? "OFF" : "ON"
    }

    Scoreboard {
        x: 150
        y: 50
        model: modelv

        //visible: getScoreboardVisible()
        state: getScoreboardState()

        //visible: (!actorv.giveMarksP && !actorv.giveHighMarkP) ? false : true
        //state: (actorv.giveMarksP && actorv.readyHighP && !actorv.giveHighMarkP) ? "OFF" : "ON"
        focus: true
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Space) {
                                //qae.state = "ON";
                                actorv.juryReveal();
                                event.accepted = true;
            }
        }

        function getScoreboardVisible(){

            if (!actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return false
            }
            else if (actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return false
            }
            else if (actorv.readyP && actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return false
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return true
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && actorv.giveHighMarkP) {
                //visible = true;
                return true
            }
            else {
                //visible = false;
                return false
            }
        }

        function getScoreboardState(){
            if (!actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "ON"
            }
            else if (actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "ON"
            }
            else if (actorv.readyP && actorv.giveMarksP && !actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "ON"
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && !actorv.giveHighMarkP) {
                //visible = true;
                return "OFF"
            }
            else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP && actorv.giveHighMarkP) {
                //visible = true;
                return "OFF"
            }
            else {
                //visible = false;
                return "ON"
            }
        }
    }


}
