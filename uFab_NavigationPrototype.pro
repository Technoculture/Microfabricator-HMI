QT += quick serialport charts

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        ucserial.cpp

RESOURCES += \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Assets/logo-small.png \
    Assets/logo.png \
    Checklist.qml \
    Drawer.qml \
    Drawers/LightEngineOk.qml \
    Drawers/MaskPlaced.qml \
    Drawers/SetDuration.qml \
    Drawers/SetPower.qml \
    Drawers/TrayClosed.qml \
    Drawers/VibrationMonitor.qml \
    Drawers/WaferMaskDistance.qml \
    Drawers/WaferPlaced.qml \
    ExposureElapse.qml \
    GlobalState.qml \
    MainApp.qml \
    Progress.qml \
    SplashScreen.qml \
    StatusBar.qml \
    UIStyle.qml \
    VibrationPlot.qml \
    main.qml

HEADERS += \
    ucserial.h
