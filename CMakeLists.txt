cmake_minimum_required(VERSION 3.5)

project(mfabHMI LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt5 REQUIRED
    COMPONENTS
    Core
    Gui
    Qml
    Quick
    SerialPort
    Charts)

add_executable(MicrofabricatorHMI
    main.cpp
    src/distancesensecontroller.cpp
    src/sensorscontroller.cpp
    src/slidercontroller.cpp
    src/ucserial.cpp
    src/uvfanpumpcontroller.cpp
    src/vibrationmodel.cpp

    include/distancesensecontroller.h
    include/sensorscontroller.h
    include/slidercontroller.h
    include/ucserial.h
    include/uvfanpumpcontroller.h
    include/vibrationmodel.h

    qml.qrc
)

target_link_libraries(MicrofabricatorHMI
    PUBLIC
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
    Qt5::SerialPort
    Qt5::Charts
)

install(
  TARGETS MicrofabricatorHMI
  RUNTIME
    DESTINATION bin
    COMPONENT runtime
)
