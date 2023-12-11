import QtQuick 2.15
import QtQuick.Window 2.15
import com.company.test 1.0
import QtQuick.Layouts 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Windows 6.0
import QtQuick3D

Window {
    id: window
    width: 640
    height: 480
    visible: true
    color: "#ffffff"
    title: qsTr("Hello World")

    Test {
        id: test
        onStatus: randomLabel.text = data
        onNameChanged: nameResultLabel.text = name
        onCgpeChanged: cgpeResultLabel.text = cgpe
        onResultChecked: resultLabel.text = result
    }

    Column {
        id: column
        y: 16
        width: 356
        height: 454
        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        Label {
            id: label
            color: "#ff4444"
            text: qsTr("Student Register")
            layer.effect: label
            font.weight: Font.DemiBold
            font.capitalization: Font.AllUppercase
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pointSize: 20
        }

        Row {
            id: row
            y: 100
            width: 320
            height: 47
            spacing: 15

            Label {
                id: nameLabel
                y: 10
                width: 130
                height: 25
                text: qsTr("Student Name")
                font.pixelSize: 16
                font.capitalization: Font.Capitalize
                //anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.bold: false
            }

            TextField {
                id: nameInput
                x: 150
                y: 5
                width: 175
                height: 38
                text: qsTr("")
                font.pixelSize: 16
                //anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Row {
            id: row1
            x: 0
            y: 200
            width: 320
            height: 47
            spacing: 15

            Label {
                id: cgpeLabel
                y: 10
                width: 130
                height: 25
                text: qsTr("Student Cgpe")
                font.pixelSize: 16
                font.capitalization: Font.Capitalize
                //anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.bold: false
            }

            TextField {
                id: cgpeInput
                y: 5
                width: 175
                height: 38
                text: qsTr("")
                font.pixelSize: 16
                //anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Button {
        id: resultBtn
        x: 270
        y: 270
        width: 200
        height: 58
        text: "Result"
        anchors.verticalCenter: grid.verticalCenter
        font.pixelSize: 24
        property color property0: "#714e4c"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: column.horizontalCenter
        onClicked: {
            var nameText = nameInput.text
            var cgpeText = cgpeInput.text
            test.setName(nameText)
            test.setCgpe(cgpeText)
            test.setResult()
        }
    }
    Button {
        id: ramdomBtn
        x: 150
        y: 200
        width: 120
        height: 48
        text: "Random"
        anchors.verticalCenter: grid.verticalCenter
        font.pixelSize: 20

        onClicked: {
            var num = Math.round(Math.random())
            test.works(num)
        }
    }

    Column {
        id: column1
        x: 394
        y: 8
        width: 231
        height: 454

        //anchors.horizontalCenter: parent.horizontalCenter
        Label {
            id: label1
            color: "#008000"
            text: qsTr("Student result")
            layer.effect: label
            font.weight: Font.DemiBold
            font.capitalization: Font.AllUppercase
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pointSize: 20
        }
        Label {
            id: nameResultLabel
            y: 130
            width: 130
            height: 25
            text: qsTr("Name")
            font.pixelSize: 20
            font.capitalization: Font.Capitalize
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.bold: false
        }
        Label {
            id: randomLabel
            y: 160
            width: 130
            height: 25
            text: qsTr("Random")
            font.pixelSize: 20
            font.capitalization: Font.Capitalize
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.bold: false
        }
        Label {
            id: cgpeResultLabel
            width: 130
            y: 190
            height: 25
            text: qsTr("cgpe")
            font.pixelSize: 20
            font.capitalization: Font.Capitalize
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.bold: false
        }
        Label {
            id: resultLabel
            width: 130
            height: 25
            text: qsTr("Result")
            font.pixelSize: 20
            font.capitalization: Font.Capitalize
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.bold: false
        }
    }

    Rectangle {
        id: rectangle
        x: 377
        y: 8
        width: 1
        height: 465
        color: "#0d0d0d"
        border.width: 0
        //anchors.verticalCenter: parent.verticalCenter
    }

    Item {
        id: __materialLibrary__
    }
}
