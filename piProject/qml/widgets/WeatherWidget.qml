import QtQuick

Rectangle {
    id: weatherWidget
    width: 350
    height: 200
    color: "#2E3B4E"
    radius: 10

    Column {
        anchors.centerIn: parent
        spacing: 10

        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            // Icon
            Image {
                id: weatherIcon
                source: todayWeatherData.iconUrl
                width: 150
                height: 150
                fillMode: Image.PreserveAspectFit
            }

            // Temperature and Condition
            Column {
                spacing: 5

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: temperatureText
                    text: todayWeatherData.temperature
                    font.pixelSize: 50
                    color: "lightblue"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: conditionText
                    text: todayWeatherData.condition
                    font.pixelSize: 40
                    color: "white"
                }
            }
        }
    }
}
