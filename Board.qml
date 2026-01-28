import QtQuick

GridView {
    id: qae
    x: 250
    y: 250
    width: 600
    height: 500
    cellWidth: 254
    cellHeight: 54
    required model

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
                heartImage: "images/flag.png"
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
            }
        }


}
