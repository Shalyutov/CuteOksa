import QtQuick
import QtQuick.Effects

Window {
    width: 1200
    height: 800
    visible: true
    title: qsTr("Scoreboard")
    color: "black"
    x: 100
    y: 100

    FontLoader {
        id: fontv
        source: "./fonts/Manrope.ttf"
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
        x: 150
        y: 50
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
