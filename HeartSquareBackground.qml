import QtQuick

Item {
    id: qaes

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
                Repeater {
                    model: 3
                    Item {
                        height: 20
                        width: 20
                        clip: true
                        required property int index
                        HeartSmallPanelOpt {
                            height: 20
                            width: 20
                            indexP: index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                        }
                    }
                }
            }
            Row {
                spacing: -2
                Repeater {
                    model: 3
                    delegate: Item {
                        height: 20
                        width: 20
                        clip: true
                        required property int index
                        HeartSmallPanelOpt {

                            height: 20
                            width: 20
                            indexP: index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                        }
                    }
                }
            }
            Row {
                spacing: -2
                Repeater {
                    model: 3
                    delegate: Item {
                        height: 20
                        width: 20
                        clip: true
                        required property int index
                        HeartSmallPanelOpt {
                            height: 20
                            width: 20
                            indexP: index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                        }
                    }
                }
            }
        }
    }
}
