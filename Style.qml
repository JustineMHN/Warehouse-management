pragma Singleton

import QtQuick 2.15

Item {
    property string version: "1.0"
    readonly property color colourBackground: "#efefef"

    // Define a list to store the product and the category data
    property var products: []
    property var categories: []
    property var newUser: ({})

    //function to read and load the product data from the JSON file
    function readXML(file, callback) {
        var xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var responseJson = JSON.parse(xhr.responseText)
                    callback(responseJson)
                } else {
                    console.error("Failed to load " + file)
                    callback(null)
                }
            }
        }
        xhr.open("GET", file)
        xhr.send()
    }

    //function to add a new user to JSON file
    function addUserToFile(url, newUser) {
        var xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log("User added successfully.")
                } else {
                    console.error("Failed to add the user.")
                }
            }
        }

        xhr.open("GET", url)
        xhr.setRequestHeader("Content-Type", "application/json")
        xhr.onload = function () {
            if (xhr.status === 200) {
                var users = JSON.parse(xhr.responseText)
                users.push(newUser)

                var xhrPut = new XMLHttpRequest()
                xhrPut.open("PUT", url)
                xhrPut.setRequestHeader("Content-Type", "application/json")
                xhrPut.onreadystatechange = function () {
                    if (xhrPut.readyState === XMLHttpRequest.DONE) {
                        if (xhrPut.status === 200) {
                            console.log("User file updated successfully.")
                        } else {
                            console.error("Failed to update the user file.")
                        }
                    }
                }
                xhrPut.send(JSON.stringify(users))
            } else {
                console.error("Failed to retrieve the file.")
            }
        }
        xhr.send()
    }

    // Usage
    Component.onCompleted: {
        var productFile = Qt.resolvedUrl("qrc:/json/products.json")
        var categoryFile = Qt.resolvedUrl("qrc:/json/categories.json")

        readXML(productFile, function (data) {
            if (data) {
                products = data
            }
        })

        readXML(categoryFile, function (data) {
            if (data) {
                categories = data
            }
        })
        var userFile = Qt.resolvedUrl("qrc:/json/users.json")
        newUser = {
            "user": "john",
            "pwd": "password123"
        }
        addUserToFile(userFile, newUser)
    }
}
