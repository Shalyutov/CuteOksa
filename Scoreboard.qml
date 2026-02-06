import QtQuick

GridView {
    id: qae

    width: 354*2
    height: 54*13
    cellWidth: 354
    cellHeight: 54
    required model

    flow: GridView.FlowTopToBottom
    layoutDirection: "LeftToRight"

    required state
    states: [
        State {
            name: "OFF"
        },
        State {
            name: "ON"
        }
    ]
    //+ (dispTrans.ViewTransition.index -
    //dispTrans.ViewTransition.targetIndexes[0]) * 50

    moveDisplaced: Transition {
        id: dispTrans
        SequentialAnimation{
            PauseAnimation {
                duration: 4000 //+ (dispTrans.ViewTransition.targetIndexes[0]) * 50
            }
            NumberAnimation {
                properties: "x,y"; duration: 1000; easing.type: Easing.OutCubic
            }
        }

    }

    move: Transition {
        id: dispTrans2
        SequentialAnimation{

            PauseAnimation {
                duration: 4000 //+ (dispTrans2.ViewTransition.index -
                                 // dispTrans2.ViewTransition.targetIndexes[0]) * 50
            }
            NumberAnimation { properties: "x,y"; duration: 1000; easing.type: Easing.OutCubic}
        }

    }
    displaced: Transition {
        id: dispTrans3
            SequentialAnimation{

                PauseAnimation {
                    duration: 4000 //+ (dispTrans3.ViewTransition.index -
                                    //  dispTrans3.ViewTransition.targetIndexes[0]) * 50
                }
                NumberAnimation { properties: "x,y"; duration: 1000; easing.type: Easing.OutCubic}
            }

        }



    delegate: Row {
        id: scoreRow
        padding: 2

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
                        target: scoreRow
                        property: "opacity"
                        //from: 0.0
                        to: 1.0
                        duration: 100
                    }
                    }
                }
            ,
            Transition {
                from: "OFF"
                to: "ON"
                PropertyAnimation {
                    target: scoreRow
                    property: "opacity"
                    //from: 1.0
                    to: 0.0
                    duration: 100
                }
            }
        ]
        required property string participant
        required property int points
        required property int mark
        required property int issuer
        required property int index

        property real anim: points
        Behavior on anim {
            SequentialAnimation{

                PauseAnimation {
                    duration: 1000
                }
                NumberAnimation { duration: 200 }
            }

        }
            HeartImage {
                width: 50
                height: 50
                clip: true
                state: qae.state
                heartImage: participant == "Россия" ? "images/rus.png" : "images/esc_s.png"
                indexP: (1 * ((index+1)%14))
            }
            Rectangle{
                width: 200
                height: 50
                color: "transparent"
                //clip: true
                HeartBackground{
                    width: 250
                    height: 50
                    clip: true
                    heartColor: "indigo"
                    state: qae.state
                    delay: 0 + (1 * ((index+1)%14))
                    inverted: false
                }
                Rectangle {
                    id: ccv
                    x: 0
                    y: 0
                    width: 250
                    height: 50
                    clip: true
                    color: "transparent"
                    opacity: 0.0
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
                            SequentialAnimation {

                                PauseAnimation {
                                    duration: 100 * (6 + (1 * ((index+1)%14)))
                                }
                                PropertyAnimation {
                                    target: ccv
                                    property: "opacity"
                                    //from: 0.0
                                    to: 1.0
                                    duration: 200
                                }
                            }
                        },
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
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        //opacity: 0.0 // (qae.state === "OFF" ? 1.0 : 0.0)

                        color: 'white'

                        font.family: fontv.name
                        font.pixelSize: 22;
                        font.bold: true;
                    }
                }
                HeartBackground{
                    width: 250
                    height: 50
                    clip: true
                    heartColor: "cyan"
                    state: mark == 12 && issuer == 0 ? qae.state : "ON"
                    inverted: true
                    delay: 4
                    opacity: mark > 0 && mark == 12 ? 1.0 : 0.0
                }
                Rectangle {
                    id: ccz
                    x: 0
                    y: 0
                    width: 250
                    height: 50
                    clip: true
                    color: "transparent"
                    opacity: 0.0
                    state: mark == 12 && issuer == 0 ? qae.state : "ON"
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
                            SequentialAnimation {

                                PauseAnimation {
                                    duration: 1500 //100 * (6 + (1 * ((index+1)%14)))
                                }
                                PropertyAnimation {
                                    target: ccz
                                    property: "opacity"
                                    //from: 0.0
                                    to: 1.0
                                    duration: 200
                                }
                            }
                        },
                        Transition {
                            from: "OFF"
                            to: "ON"
                            PropertyAnimation {
                                target: ccz
                                property: "opacity"
                                //from: 1.0
                                to: 0.0
                                duration: 200
                            }
                        }
                    ]

                    Text {
                        text: participant
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        //opacity: 0.0 // (qae.state === "OFF" ? 1.0 : 0.0)

                        color: 'indigo'

                        font.family: fontv.name
                        font.pixelSize: 22;
                        font.bold: true;
                    }
                }
                HeartBackground{
                    width: 250
                    height: 50
                    clip: true
                    heartColor: "magenta"
                    state: mark >= 0 && issuer == 1 ? qae.state : "ON"
                    inverted: true
                    delay: 4
                    opacity: mark >= 0 && issuer == 1 ? 1.0 : 0.0
                }
                Rectangle {
                    id: ccq
                    x: 0
                    y: 0
                    width: 250
                    height: 50
                    clip: true
                    color: "transparent"
                    opacity: 0.0
                    state: mark >= 0 && issuer == 1 ? qae.state : "ON"
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
                            SequentialAnimation {

                                PauseAnimation {
                                    duration: 1500 //100 * (6 + (1 * ((index+1)%14)))
                                }
                                PropertyAnimation {
                                    target: ccq
                                    property: "opacity"
                                    //from: 0.0
                                    to: 1.0
                                    duration: 200
                                }
                            }
                        },
                        Transition {
                            from: "OFF"
                            to: "ON"
                            PropertyAnimation {
                                target: ccq
                                property: "opacity"
                                //from: 1.0
                                to: 0.0
                                duration: 200
                            }
                        }
                    ]

                    Text {
                        text: participant
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        //opacity: 0.0 // (qae.state === "OFF" ? 1.0 : 0.0)

                        color: 'indigo'

                        font.family: fontv.name
                        font.pixelSize: 22;
                        font.bold: true;
                    }
                }

            }

            Rectangle{
                width: 50
                height: 50
                color: "transparent"
                clip: true


                Rectangle{
                    width: 50
                    height: 50
                    color: "transparent"
                    opacity: mark > 0 && issuer == 0 ? 1.0 : 0.0

                    HeartPanel {
                        width: 50
                        height: 50
                        clip: true
                        heartColor: "magenta"
                        state: mark > 0 && mark < 12 && issuer == 0 ? qae.state : "ON"
                        indexP: 8 + 4 + (1 * ((index+1)%14))
                        opacity: mark > 0 && mark < 12 && issuer == 0  ? 1.0 : 0.0
                    }
                    HeartPanel {
                        width: 50
                        height: 50
                        clip: true
                        heartColor: "cyan"
                        state: mark > 0 && mark == 12 && issuer == 0  ? qae.state : "ON"
                        indexP: 0
                        opacity: mark > 0 && mark == 12 && issuer == 0  ? 1.0 : 0.0
                    }
                    HeartPanel {
                        width: 50
                        height: 50
                        clip: true
                        heartColor: "magenta"
                        state: mark > 0 && mark == 12 && issuer == 0  ? qae.state : "ON"
                        indexP: 30
                        opacity: mark > 0 && mark == 12 && issuer == 0  ? 1.0 : 0.0
                    }
                    Rectangle {
                        id: ddfm
                        state: mark > 0 && mark < 12 && issuer == 0  ? qae.state : "ON"
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        clip: true
                        color: "transparent"
                        opacity: 0.0//mark > 0 && mark < 12 ? 1.0 : 0.0
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
                                SequentialAnimation {

                                    PauseAnimation {
                                        duration: 100 * (8 + 4 + (1 * ((index+1)%14)))
                                    }
                                    PropertyAnimation {
                                        target: ddfm
                                        property: "opacity"
                                        //from: 0.0
                                        to: 1.0
                                        duration: 200
                                    }
                                }
                            },
                            Transition {
                                from: "OFF"
                                to: "ON"
                                PropertyAnimation {
                                    target: ddfm
                                    property: "opacity"
                                    //from: 1.0
                                    to: 0.0
                                    duration: 200
                                }
                            }
                        ]
                        Text {
                            id: marktext
                            text:  mark //points //Math.floor(anim).toFixed(0)
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            opacity: (qae.state === "OFF" ? 1.0 : 0.0)

                            color: mark == 12 && issuer == 0 ? "purple" : "white"

                            font.family: fontv.name
                            font.pixelSize: 20;
                            font.bold: true;

                            state: mark == 12 && issuer == 0  ? qae.state : "ON"
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
                                    SequentialAnimation {
                                        ColorAnimation {
                                            target: marktext
                                            property: "color"
                                            //from: 0.0
                                            to: "purple"
                                            duration: 200
                                        }

                                        PauseAnimation {
                                            duration: 3000
                                        }
                                        ColorAnimation {
                                            target: marktext
                                            property: "color"
                                            //from: 0.0
                                            to: "white"
                                            duration: 200
                                        }
                                    }
                                },
                                Transition {
                                    from: "OFF"
                                    to: "ON"
                                    ColorAnimation {
                                        target: marktext
                                        property: "color"
                                        //from: 0.0
                                        to: "white"
                                        duration: 200
                                    }
                                }
                            ]

                        }
                    }
                    Rectangle {
                        id: ddfp
                        state: mark > 0 && mark == 12 && issuer == 0 ? qae.state : "ON"
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        clip: true
                        color: "transparent"
                        opacity: 0.0
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
                                SequentialAnimation {

                                    PropertyAnimation {
                                        target: ddfp
                                        property: "opacity"
                                        //from: 0.0
                                        to: 1.0
                                        duration: 200
                                    }
                                }
                            },
                            Transition {
                                from: "OFF"
                                to: "ON"
                                PropertyAnimation {
                                    target: ddfp
                                    property: "opacity"
                                    //from: 1.0
                                    to: 0.0
                                    duration: 200
                                }
                            }
                        ]
                        Text {
                            id: marktex
                            text:  mark //points //Math.floor(anim).toFixed(0)
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            opacity: (qae.state === "OFF" ? 1.0 : 0.0)

                            //color: mark == 12 ? "purple" : "white"

                            font.family: fontv.name
                            font.pixelSize: 20;
                            font.bold: true;

                            state: mark == 12 && issuer == 0  ? qae.state : "ON"
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
                                    SequentialAnimation {
                                        ColorAnimation {
                                            target: marktex
                                            property: "color"
                                            //from: 0.0
                                            to: "purple"
                                            duration: 200
                                        }

                                        PauseAnimation {
                                            duration: 3000
                                        }
                                        ColorAnimation {
                                            target: marktex
                                            property: "color"
                                            //from: 0.0
                                            to: "white"
                                            duration: 200
                                        }
                                    }
                                },
                                Transition {
                                    from: "OFF"
                                    to: "ON"
                                    ColorAnimation {
                                        target: marktex
                                        property: "color"
                                        //from: 0.0
                                        to: "white"
                                        duration: 200
                                    }
                                }
                            ]
                        }
                    }
                }
                Rectangle{
                    id: rjj
                    width: 50
                    height: 50
                    color: "transparent"
                    visible: mark >= 0 && issuer == 1 ? true : false

                    state: mark >= 0 && issuer == 1 ? "OFF" : "ON"
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
                            SequentialAnimation {
                                PauseAnimation{duration: 5000}
                                PropertyAnimation {
                                    target: rjj
                                    property: "opacity"
                                    //from: 0.0
                                    to: 0.0
                                    duration: 200
                                }
                                }
                            }
                        ,
                        Transition {
                            from: "OFF"
                            to: "ON"
                            PropertyAnimation {
                                target: rjj
                                property: "opacity"
                                //from: 1.0
                                to: 0.0
                                duration: 100
                            }
                        }
                    ]

                    HeartPanel {
                        width: 50
                        height: 50
                        clip: true
                        heartColor: "magenta"
                        state: mark >= 0 && issuer == 1 ? qae.state : "ON"
                        indexP: 0
                        opacity: mark >= 0 && issuer == 1 ? 1.0 : 0.0
                    }
                    Rectangle {
                        id: ddfi
                        state: qae.state //juryState
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        clip: true
                        color: "transparent"
                        opacity: 0.0
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
                                SequentialAnimation {

                                    PauseAnimation {
                                        duration: 100 * (10 + (1 * ((index+1)%14 )))
                                    }
                                    PropertyAnimation {
                                        target: ddfi
                                        property: "opacity"
                                        //from: 0.0
                                        to: 1.0
                                        duration: 200
                                    }
                                }
                            },
                            Transition {
                                from: "OFF"
                                to: "ON"
                                PropertyAnimation {
                                    target: ddfi
                                    property: "opacity"
                                    //from: 1.0
                                    to: 0.0
                                    duration: 200
                                }
                            }
                        ]
                        Text {
                            text:  mark //points //Math.floor(anim).toFixed(0)
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            opacity: (qae.state === "OFF" ? 1.0 : 0.0)

                            color: "white"

                            font.family: fontv.name
                            font.pixelSize: 20;
                            font.bold: true;

                        }
                    }
                }


                /*HeartBackground{
                    width: 50
                    height: 50
                    clip: true
                    heartColor: mark == 12 ? "cyan" : "purple"
                    state: qae.state
                    delay: 8 + (2 * (model.rowCount() - index))
                }*/

            }
            Rectangle{
                width: 50
                height: 50
                color: "transparent"
                clip: true
                HeartSquareBackground{
                    width: 50
                    height: 50
                    clip: true
                    heartColor: "white" //points == 12 ? "cyan" : "white"
                    state: qae.state
                    delay: 10 + (1 * ((index+1)%14 ))
                }
                Rectangle {
                    id: ddf
                    state: qae.state //juryState
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    clip: true
                    color: "transparent"
                    opacity: 0.0
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
                            SequentialAnimation {

                                PauseAnimation {
                                    duration: 100 * (10 + (1 * ((index+1)%14)))
                                }
                                PropertyAnimation {
                                    target: ddf
                                    property: "opacity"
                                    //from: 0.0
                                    to: 1.0
                                    duration: 200
                                }
                            }
                        },
                        Transition {
                            from: "OFF"
                            to: "ON"
                            PropertyAnimation {
                                target: ddf
                                property: "opacity"
                                //from: 1.0
                                to: 0.0
                                duration: 200
                            }
                        }
                    ]
                    Text {
                        text: Math.floor(anim).toFixed(0) //points
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        opacity: (qae.state === "OFF" ? 1.0 : 0.0)

                        color: "black" //points == 12 ? "purple" : "black"

                        font.family: fontv.name
                        font.pixelSize: 20
                        font.bold: true
                    }
                }

            }


        }


}
