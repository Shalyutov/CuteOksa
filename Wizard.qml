import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: newWindow
    width: 400
    height: 200
    title: "Spokeperson"
    visible: true
    color: "black"
    x: 950
    y: 300
    required property string hint

    Label {
        text: hint
        anchors.fill: parent
        anchors.margins: 32
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "white"
        font.family: fontv.name
        font.pixelSize: 20
        font.bold: true
    }
}
