import QtQuick 2.15
import QtQuick.Controls 2.5
import Warehouse.Management 1.0

Item {
    id: root
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 640
        height: 480
        color: "#ffffff"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: addProLabel
            x: 271
            y: 8
            width: 197
            height: 30
            color: "#0000ff"
            text: qsTr("Edit Product")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Semibold"
        }

        Column {
            id: column
            x: 109
            y: 62
            width: 430
            height: 410
            spacing: 5

            Row {
                id: row
                width: 430
                height: 40
                spacing: 20

                Label {
                    id: codeLabel
                    width: 106
                    height: 35
                    text: qsTr("Code")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                TextField {
                    id: codeInput
                    width: 286
                    height: 35
                    font.pixelSize: 12
                }
            }

            Row {
                id: row1
                width: 430
                height: 40
                spacing: 20

                Label {
                    id: nameLabel
                    width: 106
                    height: 35
                    text: qsTr("Name")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                TextField {
                    id: nameInput
                    width: 284
                    height: 35
                    font.pixelSize: 12
                }
            }

            Row {
                id: row2
                width: 430
                height: 40
                spacing: 20

                Label {
                    id: priceLabel
                    width: 106
                    height: 35
                    text: qsTr("Price")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                TextField {
                    id: priceInput
                    width: 284
                    height: 35
                    font.pixelSize: 12
                }
            }

            Row {
                id: row3
                width: 430
                height: 40
                spacing: 20

                Label {
                    id: desLabel
                    width: 106
                    height: 35
                    text: qsTr("Description")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                TextField {
                    id: desInput
                    width: 284
                    height: 35
                    font.pixelSize: 12
                }
            }

            Row {
                id: row4
                width: 430
                height: 40
                spacing: 20

                Label {
                    id: quantityLabel
                    width: 106
                    height: 35
                    text: qsTr("Quantity")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                TextField {
                    id: quantityInput
                    width: 284
                    height: 35
                    font.pixelSize: 12
                }
            }

            Row {
                id: row5
                width: 430
                height: 40
                spacing: 20

                Label {
                    id: measureLabel
                    width: 106
                    height: 35
                    text: qsTr("Measure")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                TextField {
                    id: measureInput
                    width: 284
                    height: 35
                    font.pixelSize: 12
                }
            }

            Row {
                id: row6
                width: 430
                height: 41
                spacing: 20

                Label {
                    id: categoryLabel
                    width: 106
                    height: 35
                    text: qsTr("Category")
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                TextField {
                    id: categoryInput
                    width: 284
                    height: 35
                    font.pixelSize: 12
                }
            }

            Row {
                id: row7
                x: 154
                y: 322
                width: 273
                height: 45
                spacing: 20

                Button {
                    id: saveBtn
                    width: 120
                    height: 37
                    Text {
                        id: saveText
                        x: 0
                        y: 4
                        width: 119
                        height: 30
                        text: qsTr("Save")
                        font.pixelSize: 20
                        font.weight: Font.DemiBold
                        color: "green"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Button {
                    id: cancelBtn
                    width: 118
                    height: 37
                    Text {
                        id: cancelText
                        x: 0
                        y: 4
                        width: 118
                        height: 30
                        text: qsTr("Cancel")
                        font.pixelSize: 20
                        font.weight: Font.DemiBold
                        color: "red"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked: masterController.ui_navigationController.goDashboardView()
                }
            }
        }
    }
}
