import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts


ApplicationWindow {
    minimumWidth: 700
    minimumHeight: 500
    width: 1000
    height: 633
    visible: true
    Material.theme: Material.System
    Material.primary: "#C5CAE9"
    Material.background: "#C5CAE9"
    title: qsTr("integrals.pank.su")

    Loader{
        anchors.fill: parent
        id: pageLoader
        source: "splash.qml"
    }

    Component.onCompleted: {
        var http = new XMLHttpRequest()
        var url = "http://phhask.pank.su"
        http.open("GET", url, true)
        http.onreadystatechange = function(){
             console.log(http.status)
             if (http.readyState == 4 && http.status == 200){
                pageLoader.source = "auth.qml"

             }
        }
        http.send()
    }
}
