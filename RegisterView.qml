import QtQuick 2.15
import QtQuick.Controls 2.5


Item {
    Rectangle {
        id: login
        x: 0
        y: 0
        width: 640
        height: 480
        color: "#f7fbff"
        radius: 1
        border.color: "#3e3e3e"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: rectangle2
            width: 394
            height: 351
            color: "#ffffff"
            border.color: "#ffffff"
            border.width: 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: title
            x: 221
            y: 8
            width: 191
            height: 41
            color: "#0000ff"
            text: qsTr("Register Form")
            font.pixelSize: 30
            font.weight: Font.DemiBold
            font.bold: false
            leftPadding: 10
        }

        Row {
            id: row
            x: 124
            y: 127
            width: 394
            height: 45
            spacing: 15

            Label {
                id: nameLabel
                width: 130
                height: 45
                text: qsTr("Name")
                font.pixelSize: 18
                verticalAlignment: Text.AlignVCenter
                leftPadding: 10
            }

            TextField {
                id: nameInput
                width: 240
                height: 45
                text: qsTr("")
                font.pixelSize: 18
                leftPadding: 20
                verticalAlignment: Text.AlignVCenter
            }
        }

        Row {
            id: row1
            x: 124
            y: 200
            width: 394
            height: 45
            spacing: 15

            Label {
                id: passwordLabel
                width: 130
                height: 45
                text: qsTr("Password")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                leftPadding: 10
            }

            TextField {
                id: passwordInput
                width: 240
                height: 45
                text: qsTr("")
                font.pixelSize: 18
                leftPadding: 20
                echoMode: TextField.Password
                verticalAlignment: Text.AlignVCenter
            }
        }

        Row {
            id: row2
            x: 147
            y: 302
            width: 349
            height: 45
            spacing: 15

            Button {
                id: registerBtn
                width: 160
                height: 45
                text: qsTr("Register")
                font.pixelSize: 20
                onClicked: masterController.ui_navigationController.goRegisterView()
            }

            Button {
                id: loginBtn
                width: 160
                height: 45
                text: qsTr("Login")
                font.pixelSize: 20
                enabled: true
                layer.enabled: false
                onClicked: masterController.ui_navigationController.goDashboardView()
            }
        }
    }
}
