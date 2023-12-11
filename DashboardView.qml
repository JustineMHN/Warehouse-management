import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Window 2.12
import Qt.labs.qmlmodels
import Warehouse.Management 1.0
import assets 1.0

Item {
    id: dashboard
    anchors {
        topMargin: 50
    }

    Label {
        id: title
        x: 198
        y: 44
        width: 187
        height: 31
        color: "#0000ff"
        //text: qsTr("Product List")
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.DemiBold
    }

    Button {
        id: addBtn
        x: 494
        y: 64
        width: 129
        height: 45
        layer.enabled: true
        focus: false
        anchors.right: dashboard.right
        highlighted: false
        checkable: false
        checked: false
        activeFocusOnTab: true
        focusPolicy: Qt.ClickFocus
        wheelEnabled: true
        z: 1
        Text {
            id: addBtnText
            x: 0
            y: 4
            width: 125
            height: 35
            opacity: 1
            text: qsTr("Create New")
            font.pixelSize: 20
            font.weight: Font.DemiBold
            color: "green"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            layer.enabled: true
        }
        onClicked: () => {
                       masterController.ui_navigationController.goAddProductView()
                   }
    }

    property TableView tableView: tableView
    property var model: model
    ScrollView {
        anchors.fill: parent
        clip: true

        TableView {
            id: tableView
            width: parent.width
            anchors.fill: parent
            anchors.leftMargin: 46
            anchors.topMargin: 130
            columnSpacing: 0
            rowSpacing: 0
            //clip: true
            model: TableModel {
                id: model

                TableModelColumn {
                    display: "id"
                }
                TableModelColumn {
                    display: "code"
                }
                TableModelColumn {
                    display: "name"
                }
                TableModelColumn {
                    display: "description"
                }
                TableModelColumn {
                    display: "category"
                }
                TableModelColumn {
                    display: "quantity"
                }
                TableModelColumn {
                    display: "measure"
                }
                TableModelColumn {
                    display: "price"
                }
                TableModelColumn {
                    display: "actions"
                }

                rows: Style.products
            }
            //Component.onCompleted: console.log("model row3 = " + model.rowCount)
            delegate: Rectangle {
                implicitWidth: dashboard.width > 600 ? dashboard.width / 10 : 90
                implicitHeight: 70
                border.width: 1
                Text {
                    id: textField
                    text: display
                    anchors.centerIn: parent
                }
                TableView.editDelegate: TextField {
                    x: textField.x
                    y: textField.y
                    width: textField.width
                    height: textField.height
                    text: display
                    TableView.onCommit: display = text
                }
            }
        }
    }

    function addNewProduct(product) {
        // Add the new product to the model
        //model.modelReset()
        model.insertRow(model.rowCount, product)
        model.insertRow(model.rowCount, product)
        model.insertRow(model.rowCount, product)
    }
}
