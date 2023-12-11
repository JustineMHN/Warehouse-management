import QtQuick 2.15
import QtQuick.Controls 2.5
import Qt.labs.qmlmodels
import Warehouse.Management 1.0


Item {
    id: findProduct

    Row {
        id: row
        x: 100
        y: 160
        width: 440
        height: 52
    }

    TextField {
        id: proInput
        x: 113
        y: 170
        width: 372
        height: 30
        text: "Search"
        font.pixelSize: 15
        verticalAlignment: Text.AlignVCenter
    }

    Text {
        id: text1
        x: 218
        y: 230
        width: 154
        height: 33
        text: qsTr("Product")
        font.pixelSize: 16
    }
    TableView {
        anchors.fill: parent
        //anchors.rightMargin: 46
        //anchors.bottomMargin: 105
        anchors.leftMargin: 46
        anchors.topMargin: 280
        columnSpacing: 0
        rowSpacing: 0
        clip: true

        model: TableModel {
            TableModelColumn {
                display: "Code"
            }
            TableModelColumn {
                display: "Name"
            }
            TableModelColumn {
                display: "Price"
            }
            TableModelColumn {
                display: "Description"
            }
            TableModelColumn {
                display: "Quantity"
            }
            TableModelColumn {
                display: "Measure"
            }
            TableModelColumn {
                display: "Category"
            }
            TableModelColumn {
                display: "Actions"
            }

            rows: [{
                    "Code": "Code",
                    "Name": "Name",
                    "Price": "Price",
                    "Description": "Description",
                    "Quantity": "Quantity",
                    "Measure": "Measure",
                    "Category": "Category",
                    "Actions": "Actions"
                }, {
                    "Code": "123ER45",
                    "Name": "Rice",
                    "Price": "2.7",
                    "Description": "black",
                    "Quantity": "10",
                    "Measure": "kg",
                    "Category": "Food",
                    "Action": "Edit"
                }]
        }

        delegate: Rectangle {
            implicitWidth: 75
            implicitHeight: 50
            border.width: 1

            Text {
                text: display
                anchors.centerIn: parent
            }
        }
    }
}
