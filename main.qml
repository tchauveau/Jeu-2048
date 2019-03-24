import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

Window {
    id: main
    visible: true
    width: 450
    height: 620


    /*
    property int gesture_swipeLeft: 0;
    property int gesture_swipeRight: 1;
    property int gesture_swipeUp: 2;
    property int gesture_swipeDown: 3;

    function getGesture(startX, startY, endX, endY, areaWidth, areaHeight) {
        var deltaX = endX - startX;
        var right = deltaX > 0;
        var moveX = Math.abs(deltaX);

        var deltaY = endY - startY;
        var down = deltaY > 0;
        var moveY = Math.abs(deltaY);

        var minimumFactor = 0.25;

        var relativeHorizontal = moveX / areaWidth;
        var relativeVertical = moveY / areaHeight;

        if (relativeHorizontal < minimumFactor &&
                relativeVertical < minimumFactor) {
            return;
        }

        var horizontal = relativeHorizontal > relativeVertical;

        if (horizontal) {
            if (right) {
                return gesture_swipeRight;
            }
            return gesture_swipeLeft;
        }
        if (down) {
            return gesture_swipeDown;
        }
        return gesture_swipeUp;
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        property int startX: 0
        property int startY: 0

        onPressed: {
            startX = mouseX;
            startY = mouseY;
        }

        onReleased: {
            var gesture = getGesture(startX, startY,
                                     mouseX, mouseY,
                                     mouseArea.width, mouseArea.height);
            switch(gesture) {
            case gesture_swipeUp:
                board.moveUp();
                break;
            case gesture_swipeRight:
                board.moveRight();
                break;
            case gesture_swipeDown:
                board.moveDown();
                break;
            case gesture_swipeLeft:
                board.moveLeft();
                break;
            }
        }
    }

*/

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Text {
            id: title
            height: 73
            text: qsTr("2048")
            opacity: 0.9
            renderType: Text.QtRendering
            anchors.right: rectScore.left
            anchors.rightMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 55
        }

        Text {
            id: end
            x: 145
            width: 138
            height: 73
            text: {
                if (board.win) {
                    return "YOU WIN!"
                } else if (board.gameEnded) {
                    return "GAME OVER";
                } else {
                    return "";
                }
            }
            font.pointSize: 50
            fontSizeMode: Text.Fit
            anchors.top: parent.top
            anchors.topMargin: 157
            color: "#150303"
            opacity: 1
            font.family: "Verdana"
            Layout.fillWidth: true
        }


        RowLayout {
            x: 123
            y: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        Rectangle {
            id: rectScore
            x: 188
            y: 8
            width: 123
            height: 73
            color: "#dacaca"
            radius: 5
            anchors.verticalCenter: rectMeilleurScore.verticalCenter
            anchors.right: rectMeilleurScore.left
            anchors.rightMargin: 15

            Text {
                id: titleScore
                x: 23
                width: 109
                height: 29
                text: qsTr("SCORE")
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                anchors.top: parent.top
                anchors.topMargin: 8
                opacity: 0.9
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                font.pixelSize: 25
            }

            Text {
                id: score
                x: 123
                y: 0
                width: 136
                height: 30
                text: board.score
                anchors.horizontalCenter: parent.horizontalCenter
                fontSizeMode: Text.Fit
                textFormat: Text.PlainText
                anchors.top: parent.top
                anchors.topMargin: 35
                verticalAlignment: Text.AlignTop
                transformOrigin: Item.Center
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                color: "#010205"
                opacity: 0.8
                font.pointSize: Math.min(main.width, main.height) / 12
                font.family: "Verdana"
            }

        }

        Rectangle {
            id: rectMeilleurScore
            x: 319
            width: 123
            height: 73
            color: "#dacaca"
            radius: 5
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            Text {
                id: titleMeilleurScore
                x: 23
                width: 109
                height: 29
                text: qsTr("MEILLEUR")
                anchors.topMargin: 8
                fontSizeMode: Text.Fit
                opacity: 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 25
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                anchors.top: parent.top
            }

            Text {
                id: meilleurScore
                x: 123
                y: 0
                width: 136
                height: 30
                color: "#010205"
                text: board.score
                anchors.topMargin: 35
                verticalAlignment: Text.AlignTop
                fontSizeMode: Text.Fit
                font.family: "Verdana"
                textFormat: Text.PlainText
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                opacity: 0.8
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: Math.min(main.width, main.height) / 12
                anchors.top: parent.top
                transformOrigin: Item.Center
            }
        }

        Rectangle {
            id: rectRecommencer
            width: 169
            height: 52
            color: "#dacaca"
            radius: 5
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: rectScore.bottom
            anchors.topMargin: 20
            Text {
                id: titleScore1
                x: 23
                width: 145
                height: 36
                text: qsTr("Recommencer")
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.topMargin: 8
                fontSizeMode: Text.Fit
                opacity: 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                anchors.top: parent.top
            }
        }

        Rectangle {
            id: rectAnnuler
            y: 7
            height: 52
            color: "#dacaca"
            radius: 5
            anchors.left: rectRecommencer.right
            anchors.leftMargin: 35
            anchors.right: rectSommaire.left
            anchors.rightMargin: 20
            anchors.topMargin: 20
            anchors.top: rectScore.bottom
            Text {
                id: titleScore3
                x: 23
                width: 77
                height: 36
                text: qsTr("Annuler")
                anchors.topMargin: 8
                fontSizeMode: Text.Fit
                opacity: 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                anchors.top: parent.top
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: rectSommaire
            x: 345
            y: -8
            width: 85
            height: 52
            color: "#dacaca"
            radius: 5
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.topMargin: 20
            anchors.top: rectScore.bottom
            Text {
                id: titleScore2
                x: 23
                width: 131
                height: 36
                text: qsTr("!!!")
                rotation: 90
                clip: false
                anchors.topMargin: 8
                fontSizeMode: Text.Fit
                opacity: 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                anchors.top: parent.top
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
            }
        }


    }

    Rectangle {
        y: 200
        color: "#baaa9e"
        radius: 5
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 190
        anchors.bottom: parent.bottom
        border.width: 1
        anchors.bottomMargin: 20
        focus: true
        Keys.onPressed: {
            switch (event.key) {
            case Qt.Key_Up:
                board.moveUp();
                break;
            case Qt.Key_Right:
                board.moveRight();
                break;
            case Qt.Key_Down:
                board.moveDown();
                break;
            case Qt.Key_Left:
                board.moveLeft();
                break;
            }
        }

        ColumnLayout {
            anchors.fill: parent
            Rectangle {
                id: mainBoard
                Layout.fillHeight: true
                Layout.fillWidth: true

                function step() {
                    return Math.min(mainBoard.width, mainBoard.height) / 33;
                }

                width: 330
                height: 330
                color: "#baaa9e"
                radius: 5

                Grid {
                    y: mainBoard.step()
                    anchors.horizontalCenter: parent.horizontalCenter
                    rows: 4
                    columns: 4
                    spacing: mainBoard.step()

                    Repeater {
                        id: boardRepeater
                        model: board
                        delegate: Tile {
                            value: display
                            tileWidth: mainBoard.step() * 7
                        }
                    }
                }
            }
        }
    }





}


















































































/*##^## Designer {
    D{i:2;anchors_width:138;anchors_x:16;anchors_y:20}D{i:3;anchors_width:138;anchors_x:19;anchors_y:21}
D{i:4;anchors_x:47}D{i:6;anchors_x:23;anchors_y:5}D{i:7;anchors_x:123;anchors_y:0}
D{i:9;anchors_x:23;anchors_y:5}D{i:10;anchors_x:123;anchors_y:0}D{i:8;anchors_y:8}
D{i:12;anchors_x:23;anchors_y:5}D{i:11;anchors_width:123;anchors_x:26;anchors_y:8}
D{i:14;anchors_height:36;anchors_width:131;anchors_x:23;anchors_y:5}D{i:13;anchors_width:139;anchors_x:186;anchors_y:8}
D{i:16;anchors_x:23;anchors_y:5}D{i:15;anchors_width:146;anchors_x:26;anchors_y:8}
D{i:1;anchors_height:330;anchors_width:360}D{i:19;anchors_x:47}D{i:17;anchors_x:20;anchors_y:630}
}
 ##^##*/
