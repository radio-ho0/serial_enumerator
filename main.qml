import ho0 1.0
import "widget"
import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    id      : root
    visible : true
    color   : "beige"
    width   : 800
    height  : 600

    ListView {
        id     : _viewer
        width  : 730
        height : 550

        model: MyModel{
            id : _model
        }
//        delegate: Text { text: "Serial: " + name + ", " + description }
        delegate:  Serial_info_delegate {
            width        : _viewer.width
            isBusy       : busy
            portName     : name
            loc          : system_location
            desc         : description
            manu         : manufacturer
            serial_code  : serial_number
            vedor_code   : vendor
            product_code : identifier
        }

        Component.onCompleted: {
            _model.refreshModel();
        }



    }

    SpinBox {
        id     : _spin
        width  : 170
        height : 30
        value  : 5
        anchors {
            top        : _viewer.bottom
            topMargin  : 15
            left       : parent.left
            leftMargin : 5
        }

        onValueChanged:  {
            _timer.stop();
            _timer.interval = _spin.value * 1000;
            _timer.start();
        }

        Timer {
            id       : _timer
            interval : _spin.value * 1000
            repeat   : true
            running  : true
            onTriggered: {
                _viewer.model = null;
                _model.refreshModel();
                _viewer.model = _model;
            }
        }

    }

    Button {
        id: button1
        x: 187
        y: 556
        width: 121
        height: 39
        text: qsTr("Button")
        style:  BtStyle2{

        }
    }
}

