import QtQuick 2.15
import QtQuick.Window 2.15
import Warehouse.Management 1.0
import QtQuick.Layouts 6.3
import QtQuick.Controls 6.3
import QtQuick.Controls.Windows 6.0

Window {
    id: window
    width: 1024
    height: 768
    visible: true
    color: "#ffffff"
    title: qsTr("Warehouse Management")

    Component.onCompleted: contentFrame.replace("qrc:/views/loginView.qml")

    Text {
        id: title
        x: 156
        y: 0
        width: parent.width
        height: 52
        color: "#ff6347"
        text: qsTr("Warehouse Management System")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 30
    }

    Rectangle {
        id: line
        x: 158
        y: 52
        width: parent.width
        height: 1
        color: "#ff5500"
        border.color: "#ac7373"
        border.width: 2
    }
    MasterController {
        id: masterController
    }

    Connections {
        target: masterController.ui_navigationController

        function onGoAddProductView() {
            contentFrame.replace("qrc:/views/AddProductView.qml")
        }
        function onGoCategoryView() {
            contentFrame.replace("qrc:/views/CategoryView.qml")
        }
        function onGoDashboardView() {
            contentFrame.replace("qrc:/views/DashboardView.qml",
                                 contentFrame.PushTransition)
        }
        function onGoEditProductView(product) {
            contentFrame.replace("qrc:/views/EditProdutView.qml", {
                                     "selectedProduct": product
                                 })
        }
        function onGoFindProductView() {
            contentFrame.replace("qrc:/views/FindProductView.qml")
        }
        function onGoLoginView() {
            contentFrame.replace("qrc:/views/loginView.qml")
        }
        function onGoRegisterView() {
            contentFrame.replace("qrc:/views/RegisterView.qml")
        }
    }

    StackView {
        id: contentFrame
        anchors.rightMargin: -1
        anchors.bottomMargin: -1
        anchors.leftMargin: 1
        anchors.topMargin: 1
        clip: true
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: navigationBar.right
        }
        initialItem: Qt.resolvedUrl(
                         "qrc:/views/welcomView.qml") // set the first page to display
    }

    Rectangle {
        id: navigationBar
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        width: 150
        color: "#f7fbff"

        Column {
            width: parent.width
            Button {
                id: btn1
                text: "Dashboard"
                anchors {
                    top: parent.top
                    left: parent.left
                }
                width: parent.width
                height: 45
                onClicked: masterController.ui_navigationController.goDashboardView()
            }
            Button {
                id: btn2
                text: "New Product"
                anchors {
                    top: btn3.bottom
                    left: parent.left
                }
                width: parent.width
                height: 45
                onClicked: masterController.ui_navigationController.goAddProductView()
            }
            Button {
                id: btn3
                text: "Summary Category"
                anchors {
                    top: btn1.bottom
                    left: parent.left
                }
                width: parent.width
                height: 45
                onClicked: masterController.ui_navigationController.goCategoryView()
            }
            Button {
                id: btn4
                text: "Find Product"
                anchors {
                    top: btn2.bottom
                    left: parent.left
                }
                width: parent.width
                height: 45
                onClicked: masterController.ui_navigationController.goFindProductView()
            }
            Button {
                id: btn5
                text: "Logout"
                anchors {
                    top: btn4.bottom
                    left: parent.left
                }
                width: parent.width
                height: 45
                onClicked: masterController.ui_navigationController.goLoginView(
                               )
            }
        }
    }
}
