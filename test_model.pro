TEMPLATE = app

QT += qml quick
QT += serialport
CONFIG += c++11

SOURCES += main.cpp \
    mymodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    mymodel.h

OTHER_FILES += *.qml
OTHER_FILES += widget/*.qml

DISTFILES += \
    Seral_info_delegate.qml \
    ELabel.qml

