import QtQuick 2.15
import QtQuick.Controls 2.5
import Warehouse.Management 1.0
import assets 1.0

Item {
    id: loginView

    Connections {
        target: masterController.ui_user
        function onLoginSuccessful() {
            masterController.ui_navigationController.goDashboardView()
        }
        function onLoginFailed(error) {
            loginMsg.text = error
        }
        function onRegistrationSuccessful() {
            var insert = Style.newUser
            masterController.ui_navigationController.goDashboardView()
        }
        function onRegistrationFailed(error) {
            var pwd = passwordInput.text
            if (pwd.length == 0) {
                pwdError.text = "Enter a password"
            } else if (pwd.length <= 7) {
                pwdError.text = "password should be more than 7 charater"
            } else if (!(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(
                             pwd))) {
                pwdError.text = "Password should include lowercase letter, uppercase letter, number, and symbol, and be at least 8 characters long."
            } else
                loginMsg.text = error
        }
    }
    Rectangle {
        id: login
        x: 0
        y: 0
        width: 640
        height: 480
        //color: "#ccc"
        radius: 1
        border.color: "#3e3e3e"
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: rectangle2
            width: 418
            height: 369
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
            text: qsTr("Login Form")
            font.pixelSize: 30
            font.weight: Font.DemiBold
            font.bold: false
            leftPadding: 10
        }
        Label {
            id: loginMsg
            x: 131
            y: 69
            width: 378
            height: 47
            color: "#ff0017"
            text: qsTr("")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
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
                layer.wrapMode: ShaderEffectSource.ClampToEdge
            }
        }

        Row {
            id: row1
            x: 124
            y: 221
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
            x: 210
            y: 354
            width: 264
            height: 45
            spacing: 15

            Button {
                id: registerBtn
                width: 118
                height: 45
                Text {
                    id: registerText
                    x: 0
                    y: 4
                    width: 118
                    height: 45
                    text: qsTr("Register")
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: "blue"
                    horizontalAlignment: Text.AlignHCenter
                }
                onClicked: masterController.ui_user.registerUser(
                               nameInput.text, passwordInput.text)
            }

            Button {
                id: loginBtn
                width: 118
                height: 45
                enabled: true
                Text {
                    id: loginText
                    x: 0
                    y: 4
                    width: 118
                    height: 45
                    text: qsTr("Login")
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: "green"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: masterController.ui_user.login(nameInput.text,
                                                          passwordInput.text)
            }
        }

        Label {
            id: pwdError
            x: 264
            y: 272
            width: 240
            height: 35
            font.pixelSize: 12
            leftPadding: 20
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.Wrap
            transformOrigin: Item.Center
            color: "#ff0017"
        }

        Label {
            id: userNameError
            x: 269
            y: 178
            width: 240
            height: 37
            color: "#ff0017"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.Wrap
            transformOrigin: Item.Center
            leftPadding: 20
        }
    }
}
