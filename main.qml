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
    height  : 620

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

        anchors {
            top : _controls_row.bottom
            topMargin : 5
            left : parent.left
            leftMargin : 5
        }

    }

    Row {
        id : _controls_row
        anchors {
            top        : parent.top
            topMargin  : 15
            left       : parent.left
            leftMargin : 5
        }

        SpinBox {
            id     : _spin
            width  : 170
            height : 30
            anchors.verticalCenter: parent.verticalCenter
            value  : 10

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

            width: 121
            height: 39
            text: qsTr("Button")
            anchors.verticalCenter: parent.verticalCenter
            style:  BtStyle2{

            }
        }
    }


}

