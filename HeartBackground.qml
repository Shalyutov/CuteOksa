import QtQuick

Item {
    id: qae

    state: "ON"
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
                    state: qae.state
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    index: 1 + delay
                    state: qae.state
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    index: 2 + delay
                    state: qae.state
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 3 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 4 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 5 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 6 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 7 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 8 + delay
                    heartColor: qae.heartColor
                }
            }
            Row {
                spacing: -2
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 0 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 1 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 2 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 3 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 4 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 5 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 6 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 7 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 8 + delay
                    heartColor: qae.heartColor
                }
            }
            Row {
                spacing: -2
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 0 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 1 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 2 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 3 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 4 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 5 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 6 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 7 + delay
                    heartColor: qae.heartColor
                }
                HeartSmallPanel {
                    height: 20
                    width: 20
                    state: qae.state
                    index: 8 + delay
                    heartColor: qae.heartColor
                }
            }
        }
    }
}
