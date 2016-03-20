import QtQuick 2.0
import QtQuick.Controls.Styles 1.4

ButtonStyle {
    id : root

    background:         Canvas {
        id:canvas
        anchors.fill:  parent

        onPaint: {
            var ctx = canvas.getContext('2d');
            ctx.fillStyle = "rgb(200,0,0)";
            ctx.fillRect (0, 0, 55, 50);

            ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
            ctx.fillRect (30, 30, 55, 50);
        }
    }

}
