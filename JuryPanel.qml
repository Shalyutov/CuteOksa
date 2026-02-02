import QtQuick

GridView {
    id: qaef

    width: 600
    height: 800
    cellWidth: 400
    cellHeight: 54
    required model

    flow: GridView.FlowTopToBottom
    layoutDirection: "LeftToRight"

    required property string juryState
    state: juryState


    delegate: Row {
        id: scoreRow
        padding: 2

        state: juryState

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
        required property int index
        required property string participant
        required property int points
        required property int mark

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
                state: juryState
                heartImage: participant == "Россия" ? "images/rus.png" : "images/flag.png"
                indexP: (2 * (model.rowCount() - index))
            }
            Rectangle{
                width: 200
                height: 50
                color: "transparent"
                clip: true
                HeartBackground{
                    width: 200
                    height: 50
                    clip: true
                    heartColor: "indigo"
                    state: juryState
                    delay: 0 + (2 * (model.rowCount() - index))
                }
                Rectangle {
                    id: ccv
                    x: 0
                    y: 0
                    width: 200
                    height: 50
                    clip: true
                    color: "transparent"


                    Text {
                        text: participant
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        opacity: (qaef.state === "OFF" ? 1.0 : 0.0)

                        color: 'white'

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
                HeartSquareBackground{
                    width: 50
                    height: 50
                    clip: true
                    heartColor: "white" //points == 12 ? "cyan" : "white"
                    state: juryState
                    delay: 8 + (2 * (model.rowCount() - index))
                }
                Text {
                    text: mark //points //Math.floor(anim).toFixed(0)
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    opacity: (qaef.state === "OFF" ? 1.0 : 0.0)

                    color: "black" //points == 12 ? "purple" : "black"

                    font.family: fontv.name
                    font.pixelSize: 20;
                    font.bold: true;

                }
            }


        }


}
