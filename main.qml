import ho0 1.0
import "widget"
import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    id      : root
    visible : true
    color   : "beige"
    width   : 800
    height  : 600

    ListView {
        id     : _viewer
        width  : 730
        height : 400

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
}

