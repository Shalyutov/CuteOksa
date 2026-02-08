import QtQuick
import QtQuick.Effects

Window {
    width: 1300
    height: 800
    visible: true
    title: qsTr("Scoreboard")
    color: "black"
    x: 100
    y: 100


    Wizard{
        hint: getWizard();
        Item{
            focus: true
            Keys.onPressed: event => {
                                if (event.key === Qt.Key_Space) {
                                    actorv.juryReveal()
                                    actorv.publicReveal()
                                    event.accepted = true
                                } else if (event.key === Qt.Key_Escape) {
                                    actorv.reset()
                                    event.accepted = true
                                }
                            }
        }
        function getWizard() {
            if (actorv.juryP && actorv.readyP && !actorv.giveMarksP) {
                return "Баллы " + actorv.currentVote
            }
            else if (actorv.juryP && actorv.readyP && actorv.giveMarksP) {
                return actorv.currentMarkTo + "\n\n" + actorv.highMark + " баллов от " + actorv.currentVote
            }
            else if (!actorv.juryP && actorv.currentP === 0) {
                return "Разница: " + actorv.win + "\n\n" + actorv.currentVote + " - " + actorv.currentMark + " баллов"
            }
            else if (!actorv.juryP && actorv.currentP > 0) {
                return actorv.currentVote + " - " + actorv.currentMark + " баллов"
            }
            else {
                return "Дальше"
            }
        }
    }

    FontLoader {
        id: fontv
        source: "./fonts/Manrope.ttf"
    }

    Rectangle {
        id: ddfm
        width: 300
        height: 50
        x: 850
        y: 700
        color: "indigo"
        state: actorv.readyP ? "OFF" : "ON"
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
                        target: ddfm
                        property: "opacity"
                        to: 1.0
                        duration: 100
                    }
                }
            },
            Transition {
                from: "OFF"
                to: "ON"
                PropertyAnimation {
                    target: ddfm
                    property: "opacity"
                    to: 0.0
                    duration: 100
                }
            }
        ]
        Text {
            text: actorv.currentVote
            anchors.fill: parent
            anchors.leftMargin: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.family: fontv.name
            font.pixelSize: 20
            font.bold: true
        }
        Text {
            text: actorv.juryP ? (actorv.currentP + 1) + " из " + actorv.juryCount : (modelv.rowCount() - actorv.currentP) + " из " + modelv.rowCount()
            anchors.fill: parent
            anchors.rightMargin: 16
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.family: fontv.name
            font.pixelSize: 20
            font.bold: true
            visible: !actorv.readyP ? false : true
        }
    }

    JuryPanel {
        x: 350
        y: 150
        model: modelj
        countMarked: actorv.markedCount
        juryState: getJuryState()

        function getJuryState() {
            if (!actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP
                    && !actorv.giveHighMarkP) {
                return "ON"
            } else if (actorv.readyP && !actorv.giveMarksP && !actorv.readyHighP
                       && !actorv.giveHighMarkP) {
                return "ON"
            } else if (actorv.readyP && actorv.giveMarksP && !actorv.readyHighP
                       && !actorv.giveHighMarkP) {
                return "OFF"
            } else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP
                       && !actorv.giveHighMarkP) {
                return "ON"
            } else if (actorv.readyP && actorv.giveMarksP && actorv.readyHighP
                       && actorv.giveHighMarkP) {
                return "ON"
            } else {
                return "ON"
            }
        }
    }

    Scoreboard {
        x: 100
        y: 50
        highMark: actorv.highMark
        model: modelv
        state: getScoreboardState()
        focus: true
        Keys.onPressed: event => {
                            if (event.key === Qt.Key_Space) {
                                actorv.juryReveal()
                                actorv.publicReveal()
                                event.accepted = true
                            } else if (event.key === Qt.Key_Escape) {
                                actorv.reset()
                                event.accepted = true
                            }
                        }
        function getScoreboardState() {
            if (actorv.juryP && !actorv.readyP && !actorv.giveMarksP
                    && !actorv.readyHighP && !actorv.giveHighMarkP) {
                return "ON"
            } else if (actorv.juryP && actorv.readyP && !actorv.giveMarksP
                       && !actorv.readyHighP && !actorv.giveHighMarkP) {
                return "ON"
            } else if (actorv.juryP && actorv.readyP && actorv.giveMarksP
                       && !actorv.readyHighP && !actorv.giveHighMarkP) {
                return "ON"
            } else if (actorv.juryP && actorv.readyP && actorv.giveMarksP
                       && actorv.readyHighP && !actorv.giveHighMarkP) {
                return "OFF"
            } else if (actorv.juryP && actorv.readyP && actorv.giveMarksP
                       && actorv.readyHighP && actorv.giveHighMarkP) {
                return "OFF"
            } else if (!actorv.juryP) {
                return "OFF"
            } else {
                return "ON"
            }
        }
    }
}
