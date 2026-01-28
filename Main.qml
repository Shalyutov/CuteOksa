import QtQuick
import QtQuick.Effects

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"


    MouseArea {
        x: 100
        y: 100
        height: 100
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
            height: 100
            color: "blue"
            clip: true
            Text {

                text: "Старт"
                font.pixelSize: 22
                color: 'white'
                anchors.centerIn: parent
            }
        }
    }
    MouseArea {
        x: 300
        y: 100
        height: 100
        width: 100

        onClicked: {
            anim.start()

            //kkk.start()
            //hhh.children["kkk"].start();
            qae.state = "ON"
            modelv.setData(modelv.index(0, 0), "Russia", 257)
        }

        Rectangle {
            x: 0
            y: 0
            width: 100
            height: 100
            color: "blue"
            clip: true
            Text {

                text: "Стоп"
                font.pixelSize: 22
                color: 'white'
                anchors.centerIn: parent
            }
        }
    }
    MouseArea {
        x: 500
        y: 100
        height: 100
        width: 100

        onClicked: {
            anim.start()

            //kkk.start()
            //hhh.children["kkk"].start();
            //qae.state = "ON"
            actorv.start();
        }

        Rectangle {
            x: 0
            y: 0
            width: 100
            height: 100
            color: "blue"
            clip: true
            Text {

                text: "Edit"
                font.pixelSize: 22
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




    GridView {
        id: qae
        x: 250
        y: 250
        width: 600
        height: 500
        cellWidth: 254
        cellHeight: 54
        model: modelv

        flow: GridView.FlowTopToBottom
        layoutDirection: "LeftToRight"



        state: "ON"
        states: [
            State {
                name: "OFF"
            },
            State {
                name: "ON"
            }
        ]

        delegate: Row {
            padding: 2
            required property string participant
                HeartImage {
                    width: 50
                    height: 50
                    clip: true
                    state: qae.state
                    heartImage: "images/rus.png"
                }
                Rectangle{
                    width: 150
                    height: 50
                    color: "transparent"
                    clip: true
                    HeartBackground{
                        width: 150
                        height: 50
                        clip: true
                        heartColor: "indigo"
                        state: qae.state
                        delay: 0
                    }
                    Rectangle {
                        id: ccv
                        x: 0
                        y: 0
                        width: 150
                        height: 50
                        clip: true
                        color: "transparent"
                        state: qae.state

                        states: [
                            State {
                                name: "ON"
                            },
                            State {
                                name: "OFF"
                            }
                        ]
                        transitions: [
                            Transition {
                                from: "ON"
                                to: "OFF"
                                ParallelAnimation {

                                    PropertyAnimation {
                                        target: ccv
                                        property: "opacity"
                                        //from: 0.0
                                        to: 1.0
                                        duration: 200
                                    }
                                    }
                                }
                            ,
                            Transition {
                                from: "OFF"
                                to: "ON"
                                PropertyAnimation {
                                    target: ccv
                                    property: "opacity"
                                    //from: 1.0
                                    to: 0.0
                                    duration: 200
                                }
                            }
                        ]


                        Text {
                            text: participant
                            font.pixelSize: 18
                            color: 'white'
                            y: 15
                            x: 10
                            font.family: "Helvetica"


                            //anchors.centerIn: parent
                            //anchors.verticalCenter: parent

                            //horizontalAlignment: Text.AlignLeft
                        }
                    }

                }

                HeartBackground{
                    width: 50
                    height: 50
                    clip: true
                    heartColor: "white"
                    state: qae.state
                    delay: 8
                }
            }


    }


}
