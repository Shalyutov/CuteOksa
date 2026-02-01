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
    required property color heartColor
    required property int delay
    Rectangle {
        color: "transparent"

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
    }
}
