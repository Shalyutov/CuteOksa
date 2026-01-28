// HeartPanel.qml
import QtQuick
import QtQuick.Effects

Item {
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
    transitions: [
        Transition {
            from: "ON"
            to: "OFF"
            SequentialAnimation {
                PauseAnimation{duration: 100 * index}
                ParallelAnimation {
                    id: kkk
                    PropertyAnimation {
                        target: sourceImage
                        properties: "x"
                        from: -25
                        to: 35
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: sourceImage
                        properties: "y"
                        from: -25
                        to: 35
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "x"
                        from: 25
                        to: -35
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "y"
                        from: 25
                        to: -35
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "width"
                        from: 0
                        to: 120
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: ggg
                        properties: "height"
                        from: 0
                        to: 120
                        duration: 1000
                        easing.type: Easing.OutInQuad
                    }
                    PropertyAnimation {
                        target: bws
                        from: 0.0
                        to: 1.0
                        duration: 1000
                    }
                }
            }
        },
        Transition {
            from: "OFF"
            to: "ON"
            PropertyAnimation {
                target: bws
                from: 1.0
                to: 0.0
                duration: 1000
            }
        }
    ]
    Rectangle {
        id: bws
        width: 50
        height: 50
        x: 200
        y: 200
        clip: true

        Rectangle {
            id: ggg
            visible: false
            width: 60
            height: 60
            x: 0
            y: 0

            Rectangle {
                id: sourceImage
                color: "purple"
                width: 100
                height: 100
                x: 0
                y: 0
                visible: true
                clip: true
            }
        }

        MultiEffect {
            anchors.fill: ggg
            maskEnabled: true
            source: ggg
            maskSource: Image {
                source: "images/esc.png"
            }
        }
    }
}
