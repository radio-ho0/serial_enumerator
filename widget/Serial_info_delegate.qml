import QtQuick 2.0

Rectangle {
    id     : root
    width  : 631
    height : 230
    color  : "#262626"

    property var   isBusy       : "No"
    property alias portName     : _name.text
    property alias loc          : _location.text
    property alias desc         : _description.text
    property alias manu         : _manufacturer.text
    property alias serial_code  : _serial.text
    property alias vedor_code   : _vendor.text
    property alias product_code : _product.text

    Component.onCompleted:  {
        if(  isBusy == "No"){
            _busy_indentifier.color = "#647687";
        }else{
            _busy_indentifier.color = "#e51400";
        }
    }

    Row {
        id : _info
        anchors.fill:  parent
        Rectangle {
            id     : _busy_indentifier
            color  : "#647687"
            width  : 25
            height : root.height - 80
            y      : 20
            Behavior on color {
                 ColorAnimation {
                     duration: 800
                 }
            }
        }
        Grid {
            columns: 2
            spacing: 1

            ELabel {
                id    : _tip_name
                text  : "Port : "
            }
            ELabel {
                id    : _name
                color : "#b64926"
                text  : root.name
            }

            ELabel {
                id    : _tip_loc
                text  : "Location : "
            }
            ELabel {
                id    : _location
                color : "#8e2800"
            }

            ELabel {
                id    : _tip_desc
                text  : "Description : "
            }
            ELabel {
                id    : _description
                color : "#ffb03b"
            }

            ELabel {
                id    : _manu
                text  : "Manufacturer : "
            }
            ELabel {
                id    : _manufacturer
                color : "#468966"
            }

            ELabel {
                id    : _tip_serial
                text  : "Serial number : "
            }
            ELabel {
                id    : _serial
                color : "#ecf0f1"
            }

            ELabel {
                id    : _tip_vendor
                text  : "Vendor Identifier  : "
            }
            ELabel {
                id    : _vendor
                color : "#3498db"
            }

            ELabel {
                id    : _tip_product
                text  : "Product Identifier : "
            }
            ELabel {
                id    : _product
                color : "#2980b9"
            }
        } // col


    } // row




}

