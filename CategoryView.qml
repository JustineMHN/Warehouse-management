import QtQuick 2.15
import QtQuick.Controls 2.5
import Qt.labs.qmlmodels
import Warehouse.Management 1.0

import assets 1.0

Item {
    id: category
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
            id: title
            x: 206
            y: 7
            width: 315
            height: 43
            color: "#0000ff"
            text: qsTr("Category Information")
            font.weight: Font.DemiBold
            font.pointSize: 20
        }

        TableView {
            anchors.fill: parent


            /*anchors.rightMargin: 46
            anchors.bottomMargin: 105*/
            anchors.leftMargin: 80
            anchors.topMargin: 126
            columnSpacing: 0
            rowSpacing: 0
            clip: true

            model: TableModel {
                TableModelColumn {
                    display: "id"
                }
                TableModelColumn {
                    display: "name"
                }

                rows: Style.categories
            }

            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 50
                border.width: 1

                Text {
                    text: model.display
                    anchors.centerIn: parent
                }
            }
        }
    }
}
