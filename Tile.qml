import QtQuick 2.2

Rectangle {
    id: tile
    property int tileWidth: 70
    property string value: ""

    // retourn une chaine vide si 0, sinon la valeur
    function valueToText(value) {
        if (parseInt(value, 10) === 0) {
            return "";
        }
        return value;
    }

    // retourne la couleur en fonction de la valeur
    function valueToColor(value) {
        var v = parseInt(value, 10);
        var color;
        switch(v) {
        case 2:
            color = "#eee4da";
            break;
        case 4:
            color = "#eae0c8";
            break;
        case 8:
            color = "#fac66e";
            break;
        case 16:
            color = "#f59563";
            break;
        case 32:
            color = "#ea6d5b";
            break;
        case 64:
            color = "#fb3a1e";
            break;
        case 128:
            color = "#f1f061";
            break;
        case 256:
            color = "#e2e034";
            break;
        case 512:
            color = "#6ba5de";
            break;
        case 1024:
            color = "#e6cb26";
            break;
        case 2048:
            color = "#e6be26";
            break;
        default:
            color = "#cbbeb1";
        }

        return color;
    }

    function fontSize(value) {
        var v = parseInt(value, 10);
        if (v < 1024) {
            return tileWidth / 2.5;
        }
        return tileWidth / 3;
    }

    width: tileWidth
    height: tileWidth
    color: valueToColor(value)
    radius: tileWidth / 14

    Text {
        text: valueToText(value)
        font.pointSize: fontSize(value)
        anchors.centerIn: parent
        color: "black"
    }
}
