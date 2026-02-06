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
                Repeater {
                    id: rep2
                    model: 14
                    Item {
                        height: 20
                        width: 20
                        clip: true
                        required property int index
                        //required property int count
                        HeartSmallPanelOpt {

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
                Repeater {
                    id: rep1
                    model: 14

                    delegate: Item {
                        height: 20
                        width: 20
                        clip: true
                        required property int index
                        //required property int count
                        HeartSmallPanelOpt {

                            height: 20
                            width: 20
                            indexP: inverted ? rep1.count - index + delay : index
                                               + delay //index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                        }
                    }
                }
            }
            Row {
                spacing: -2
                Repeater {
                    id: rep
                    model: 14
                    delegate: Item {
                        height: 20
                        width: 20
                        clip: true
                        required property int index
                        //required property int count
                        HeartSmallPanelOpt {

                            height: 20
                            width: 20
                            indexP: inverted ? rep.count - index + delay : index
                                               + delay //index + delay
                            state: qaes.state
                            heartColor: qaes.heartColor
                        }
                    }
                }
            }
        }
    }
}
