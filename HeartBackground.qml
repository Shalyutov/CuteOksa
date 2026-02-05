import QtQuick

Item {
    id: qaes

    //state: "ON"
    states: [
        State {
            name: "OFF"
        },
        State {
            name: "ON"
        }
    ]
    transitions: [
        Transition {
            from: "ON"
            to: "OFF"
            SequentialAnimation {

                PropertyAnimation {
                    target: fffd
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
                target: fffd
                property: "opacity"
                //from: 1.0
                to: 0.0
                duration: 200
            }
        }
    ]
    required property color heartColor
    required property int delay
    required property bool inverted
    Rectangle {
        id: fffd
        color: "transparent"

        Column {
            spacing: -2
            Row {
                    spacing: -2
                    Repeater{
                        id: rep2
                        model: 15
                        Item {
                            height: 20
                            width: 20
                            required property int index
                            //required property int count
                            HeartSmallPanel {

                            height: 20
                            width: 20
                            indexP: inverted ? rep2.count - index + delay : index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                            }
                        }

                    }
                }
            Row {
                    spacing: -2
                    Repeater{
                        id: rep1
                        model: 15

                        delegate: Item {
                            height: 20
                            width: 20
                            required property int index
                            //required property int count
                            HeartSmallPanel {

                            height: 20
                            width: 20
                            indexP: inverted ? rep1.count - index + delay : index + delay //index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                            }
                        }

                    }
                }
            Row {
                    spacing: -2
                    Repeater{
                        id: rep
                        model: 15
                        delegate: Item {
                            height: 20
                            width: 20
                            required property int index
                            //required property int count
                            HeartSmallPanel {

                            height: 20
                            width: 20
                            indexP: inverted ? rep.count - index + delay : index + delay //index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                            }
                        }

                    }
                }
        }
/*
        Column {
            spacing: -2
            Row {
                spacing: -2
                HeartSmallPanel {
                    height: 20
                    width: 20
                    index: 0 + delay
                    state: qaes.state
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    index: 1 + delay
                    state: qaes.state
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    index: 2 + delay
                    state: qaes.state
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 3 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 4 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 5 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 6 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 7 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 8 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 9 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 10 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 11 + delay
                    heartColor: qaes.heartColor
                }
            }
            Row {
                spacing: -2
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 0 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 1 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 2 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 3 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 4 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 5 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 6 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 7 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 8 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 9 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 10 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 11 + delay
                    heartColor: qaes.heartColor
                }
            }
            Row {
                spacing: -2
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 0 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 1 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 2 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 3 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 4 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 5 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 6 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 7 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 8 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 9 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 10 + delay
                    heartColor: qaes.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qaes.state
                    index: 11 + delay
                    heartColor: qaes.heartColor
                }
            }
        }
    */
    }
}
