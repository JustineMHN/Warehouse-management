import QtQuick 2.15
import QtQuick.Controls 2.5


Item {
    Rectangle {
        id: welcomePage
        x: 0
        y: 0
        width: 640
        height: 480
        anchors.fill: parent
        color: Style.colourBackground

        Text {
            x: 273
            y: 196
            width: 142
            height: 43
            text: "Welcome!"
            font.pointSize: 24
        }
        Button {
            x: 237
            y: 331
            width: 179
            height: 62
            text: "Connect"
            //anchors.fill: parent
            onClicked: contentFrame.push("qrc:/views/loginView.qml")
            //onClicked: stackView.pop()
        }
    }
}
