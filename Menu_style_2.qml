import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import "variables.js" as VARIABLES

Rectangle{
    id: header1;
    width: mainWindow.width;
    height: 70;
    Image {
        id: icon
        source: VARIABLES.SRC_IMG_APP_ICON;
        fillMode: Image.PreserveAspectFit
        height: parent.height
    }
    Label {
        id: lbNAme
        text: VARIABLES.STR_APP_NAME;
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: icon.right
        anchors.leftMargin: 20
        color: "blue"
    }
    Button {
        id: btnFreeUser
        anchors.left: lbNAme.right;
        anchors.leftMargin: 20;
        text: VARIABLES.STR_BTN_FREE_USER;
        anchors.verticalCenter: parent.verticalCenter;
        Material.foreground: Material.Blue;
        //highlighted: true;
        //Material.accent: Material.color("white");
    }
    Button {
        id: btnUpgrade
        anchors.left: btnFreeUser.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 15
        text: VARIABLES.STR_BTN_UPGRADE;
        highlighted: true
        Material.accent: Material.Blue
    }
    Row {
        id: menu1
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 30
        Item {
            id: item1
            width: 50
            height: 50;
            Rectangle {
                id : rec1
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 0.6; color: rec1.color }
                   }
                Image {
                    id: page1
                    source: VARIABLES.SRC_IMG_DASHBOARD_ICON;
                    fillMode: Image.PreserveAspectFit
                    width: parent.width
                    height: parent.height
                }

            }
            state: "EXITED"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPressed: item1.state = "PRESSED"
                onReleased: if (item1.state != "EXITED" ) item1.state = "ENTERED";
                onClicked: loader.source = VARIABLES.SRC_PAGE_LIST_APPS;
                onEntered: item1.state = "ENTERED"
                onExited: item1.state = "EXITED"
            }
            states: [
                State {
                    name: "PRESSED"
                    PropertyChanges { target: rec1; color: "blue"}
                },
                State {
                    name: "ENTERED"
                    PropertyChanges { target: rec1; color: "grey"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: rec1; color: "white"}
                }
            ]
            transitions: [
                Transition {
                    from: "PRESSED"
                    to: "ENTERED"
                    ColorAnimation { target: rec1; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "PRESSED"
                    ColorAnimation { target: rec1; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: rec1; duration: 200}
                },
                Transition {
                    from: "PRESSED"
                    to: "EXITED"
                    ColorAnimation { target: rec1; duration: 500}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: rec1; duration: 300}
                }
            ]
        }
        Item {
            id : item2
            width: 50
            height: 50
            Rectangle {
                id : rec2
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 0.6; color: rec2.color }
                   }
                Image {
                    id: page2
                    source: VARIABLES.SRC_IMG_THREATS;
                    fillMode: Image.PreserveAspectFit
                    width: parent.width
                    height: parent.height
                }
            }
            state: "EXITED"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPressed: item2.state = "PRESSED"
                onReleased: if (item2.state != "EXITED" ) item2.state = "ENTERED"
                onClicked: loader.source = VARIABLES.SRC_PAGE_THREATS;
                onEntered: item2.state = "ENTERED"
                onExited: item2.state = "EXITED"
            }
            states: [
                State {
                    name: "PRESSED"
                    PropertyChanges { target: rec2; color: "blue"}
                },
                State {
                    name: "ENTERED"
                    PropertyChanges { target: rec2; color: "grey"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: rec2; color: "white"}
                }
            ]
            transitions: [
                Transition {
                    from: "PRESSED"
                    to: "ENTERED"
                    ColorAnimation { target: rec2; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "PRESSED"
                    ColorAnimation { target: rec2; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: rec2; duration: 200}
                },
                Transition {
                    from: "PRESSED"
                    to: "EXITED"
                    ColorAnimation { target: rec2; duration: 500}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: rec2; duration: 300}
                }
            ]
        }
        Item {
            id: item3
            width: 50
            height: 50
            Rectangle {
                id : rec3
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 0.6; color: rec3.color }
                   }
                Image {
                    id: page3
                    source: VARIABLES.SRC_IMG_APPLICATION;
                    fillMode: Image.PreserveAspectFit
                    width: parent.width
                    height: parent.height
                }
                Behavior on color {
                    ColorAnimation {
                        duration: 500;
                    }
                }
            }
            state: "EXITED"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPressed: item3.state = "PRESSED"
                onReleased: if (item3.state != "EXITED" ) item3.state = "ENTERED"
                onClicked: {
                    //changeState.start();
                    loader.source = VARIABLES.SRC_PAGE_DASHBOARD;
                }
                onEntered: item3.state = "ENTERED"
                onExited: item3.state = "EXITED"
            }
            states: [
                State {
                    name: "PRESSED"
                    PropertyChanges { target: rec3; color: "blue"}
                },
                State {
                    name: "ENTERED"
                    PropertyChanges { target: rec3; color: "grey"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: rec3; color: "white"}
                }
            ]
            transitions: [
                Transition {
                    from: "PRESSED"
                    to: "ENTERED"
                    ColorAnimation { target: rec3; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "PRESSED"
                    ColorAnimation { target: rec3; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: rec3; duration: 200}
                },
                Transition {
                    from: "PRESSED"
                    to: "EXITED"
                    ColorAnimation { target: rec3; duration: 500}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: rec3; duration: 300}
                }
            ]
        }
        Item {
            id: item4
            width: 50
            height: 50
            Rectangle {
                id : rec4
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 0.6; color: rec4.color }
                   }
                Image {
                    id: page4
                    source: VARIABLES.SRC_IMG_SCANNING;
                    fillMode: Image.PreserveAspectFit
                    width: parent.width
                    height: parent.height
                }
            }
            state: "EXITED"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPressed: item4.state = "PRESSED"
                onReleased: if (item4.state != "EXITED" ) item4.state = "ENTERED"
                onClicked: loader.source = VARIABLES.SRC_PAGE_SCANNING;
                onEntered: item4.state = "ENTERED"
                onExited: item4.state = "EXITED"
            }
            states: [
                State {
                    name: "PRESSED"
                    PropertyChanges { target: rec4; color: "blue"}
                },
                State {
                    name: "ENTERED"
                    PropertyChanges { target: rec4; color: "grey"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: rec4; color: "white"}
                }
            ]
            transitions: [
                Transition {
                    from: "PRESSED"
                    to: "ENTERED"
                    ColorAnimation { target: rec4; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "PRESSED"
                    ColorAnimation { target: rec4; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: rec4; duration: 200}
                },
                Transition {
                    from: "PRESSED"
                    to: "EXITED"
                    ColorAnimation { target: rec4; duration: 500}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: rec4; duration: 300}
                }
            ]
        }
        Item {
            id: item5
            width: 50
            height: 50
            Rectangle {
                id: rec5
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 0.6; color: rec5.color }
                   }
                Image {
                    id: page5
                    source: VARIABLES.SRC_IMG_CHART;
                    fillMode: Image.PreserveAspectFit
                    width: parent.width
                    height: parent.height
                }
            }
            state: "EXITED"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPressed: item5.state = "PRESSED"
                onReleased: if (item5.state != "EXITED" ) item5.state = "ENTERED"
                onClicked: loader.source = VARIABLES.SRC_PAGE_CHART;
                onEntered: item5.state = "ENTERED"
                onExited: item5.state = "EXITED"
            }
            states: [
                State {
                    name: "PRESSED"
                    PropertyChanges { target: rec5; color: "blue"}
                },
                State {
                    name: "ENTERED"
                    PropertyChanges { target: rec5; color: "grey"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: rec5; color: "white"}
                }
            ]
            transitions: [
                Transition {
                    id: abc;
                    from: "PRESSED"
                    to: "ENTERED"
                    ColorAnimation { target: rec5; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "PRESSED"
                    ColorAnimation { target: rec5; duration: 200}
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: rec5; duration: 200}
                },
                Transition {
                    from: "PRESSED"
                    to: "EXITED"
                    ColorAnimation { target: rec5; duration: 500}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: rec5; duration: 300}
                }
            ]
        }
    }
}

