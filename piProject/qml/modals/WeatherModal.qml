import QtQuick
import "../core"

Item {
    id: weatherModalRoot
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "#00000080"
    }

    Rectangle {
        id: weatherModal
        width: 700
        height: 400
        anchors.centerIn: parent
        color: "#2E3B4E"
        radius: 10

        Column {
            anchors.centerIn: parent
            spacing: 20

            // Current Time
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                id: currentTimeText
                text: Qt.formatTime(new Date(), "hh:mm:ss")
                font.pixelSize: 40
                color: "lightblue"
                horizontalAlignment: Text.AlignHCenter
            }
            Timer {
                interval: 1000; running: true; repeat: true
                onTriggered: currentTimeText.text = Qt.formatTime(new Date(), "hh:mm:ss")
            }

            // Today's Weather
            Row {
                spacing: 40
                anchors.horizontalCenter: parent.horizontalCenter

                // Current Weather (left column)
                Column {
                    spacing: 5
                    Text {
                        text: todayWeatherData.temperature
                        font.pixelSize: 32
                        font.bold: true
                        color: "lightblue"
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: todayWeatherData.condition
                        font.pixelSize: 28
                        color: "white"
                    }
                    Image {
                        width: 80
                        height: 80
                        fillMode: Image.PreserveAspectFit
                        source: todayWeatherData.iconUrl
                    }
                }

                // Hourly Forecast (right column)
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 5
                    Row {
                        spacing: 10
                        Repeater {
                            model: weatherManager.hourlyForecast
                            delegate: Column {
                                spacing: 2
                                Text {
                                    text: modelData.time  // "HH:mm"
                                    font.pixelSize: 16
                                    color: "white"
                                    horizontalAlignment: Text.AlignHCenter
                                }
                                Image {
                                    width: 50
                                    height: 50
                                    fillMode: Image.PreserveAspectFit
                                    source: modelData.icon
                                }
                                Text {
                                    text: modelData.temp
                                    font.pixelSize: 16
                                    color: "white"
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }
                        }
                    }
                }
            }

            // Weekly Forecast
            Row {
                id: forecastRow
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Repeater {
                    model: weeklyWeatherModel
                    delegate: Column {
                        spacing: 5
                        Text {
                            text: day
                            font.pixelSize: 16
                            color: "white"
                        }
                        Image {
                            width: 50
                            height: 50
                            fillMode: Image.PreserveAspectFit
                            source: iconUrl
                        }
                        Text {
                            text: maxTemperature
                            font.pixelSize: 16
                            color: "lightgray"
                        }
                        Text {
                            text: minTemperature
                            font.pixelSize: 16
                            color: "lightgray"
                        }
                    }
                }
            }
        }

        Button {
            anchors {
                right: parent.right
                top: parent.top
                margins: 10
            }
            onClicked: weatherModalRoot.closeRequested()
        }
    }

    signal closeRequested()
}
