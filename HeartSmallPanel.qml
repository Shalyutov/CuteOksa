// HeartSmallPanel.qml
import QtQuick
import QtQuick.Effects

Item {
    id: owner
    state: "ON"
    states: [
        State {
            name: "ON"
        },
        State {
            name: "OFF"
        }
    ]
    required property int index
    required property color heartColor
    transitions: [
        Transition {
            from: "ON"
            to: "OFF"
            SequentialAnimation {
                PropertyAnimation {
                    target: ggg
                    properties: "width"
                    to: 0
                    duration: 1
                    //easing.type: Easing.OutInQuad
                }
                PropertyAnimation {
                    target: ggg
                    properties: "height"
                    to: 0
                    duration: 1
                    //easing.type: Easing.OutInQuad
                }
                PropertyAnimation {
                    target: bsw
                    property: "opacity"
                    //from: 0.0
                    to: 1.0
                    duration: 1
                }
                PauseAnimation{duration: 100 * index}
                ParallelAnimation {
                    id: kkk
                    PropertyAnimation {
                        target: sourceImage
                        properties: "x"
                        from: -10
                        to: 15
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: sourceImage
                        properties: "y"
                        from: -10
                        to: 15
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "x"
                        from: 10
                        to: -15
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "y"
                        from: 10
                        to: -15
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "width"
                        from: 0
                        to: 50
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "height"
                        from: 0
                        to: 50
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                }
            }
        },
        Transition {
            from: "OFF"
            to: "ON"
            PropertyAnimation {
                target: bsw
                property: "opacity"
                from: 1.0
                to: 0.0
                duration: 200
            }
        }
    ]
    Rectangle {
        id: bsw
        width: 20
        height: 20
        //x: 200
        //y: 200
        clip: true
        color: "transparent"

        Rectangle {
            id: ggg
            visible: false
            width: 20
            height: 20
            x: 0
            y: 0
            color: "transparent"

            Rectangle {
                id: sourceImage
                color: heartColor
                width: 20
                height: 20
                x: 0
                y: 0
                visible: true
                clip: true
            }
        }

        MultiEffect {
            id: qsw
            anchors.fill: ggg
            maskEnabled: true
            source: ggg
            maskSource: Image {
                source: "images/esc.png"
            }
        }
    }
}
