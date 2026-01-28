// HeartImage.qml
import QtQuick
import QtQuick.Effects

/*Item {
    Rectangle {
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

            Image {
                id: sourceImage
                source: "images/flag.png"

                width: 100
                height: 100
                x: 0
                y: 0
                visible: true
                clip: true
            }
        }

        MultiEffect {

            //id: mm
            //anchors.fill: parent
            // Enable the mask effect
            //width: 50
            //height: 50

            //clip: true
            anchors.fill: ggg

            //anchors.margins: 30
            maskEnabled: true
            //maskInverted: true
            //containmentMask: sourceImage

            // Set the source image as the input
            source: ggg //sourceImage

            // Define the mask shape using another item as the mask source
            maskSource: Image {
                source: "images/esc.png"
            }
        }
    }

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
        //PropertyAnimation {target: sourceImage; properties: "width"; from: 0; to: 100; duration: 500;}
        //PropertyAnimation {target: sourceImage; properties: "height"; from: 0; to: 100; duration: 500;}
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
    }

}*/

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
    //required property int index
    required property string heartImage
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
                    easing.type: Easing.OutInQuad
                }
                PropertyAnimation {
                    target: ggg
                    properties: "height"
                    to: 0
                    duration: 1
                    easing.type: Easing.OutInQuad
                }
                PropertyAnimation {
                    target: bsw
                    property: "opacity"
                    //from: 0.0
                    to: 1.0
                    duration: 1
                }
                //PauseAnimation{duration: 100 * index}
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
        width: 50
        height: 50
        clip: true
        color: "transparent"

        Rectangle {
            id: ggg
            visible: false
            width: 50
            height: 50
            x: 0
            y: 0
            color: "transparent"


            Rectangle {
                id: sourceImage
                visible: true
                clip: true
                width: 50
                height: 50
                x: 0
                y: 0
                Image {
                    source: heartImage //"images/flag.png"
                    width: 50
                    height: 50
                    x: 0
                    y: 0
                    visible: true
                    clip: true
                }
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
