cmake_minimum_required(VERSION 3.16)

project(cuteoksa VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(cuteoksa
    main.cpp
)

qt_add_qml_module(cuteoksa
    URI untitled1
    QML_FILES
        Main.qml
        RESOURCES images/esc.png
        RESOURCES images/flag.png
        QML_FILES HeartImage.qml
        QML_FILES HeartPanel.qml
        QML_FILES HeartSmallPanel.qml
        QML_FILES HeartBackground.qml
        SOURCES
        SOURCES
        SOURCES scoremodel.h scoremodel.cpp
        QML_FILES Board.qml
        SOURCES scoreactor.h
        RESOURCES images/rus.png
        RESOURCES fonts/Manrope.ttf
        QML_FILES JuryPanel.qml
        QML_FILES Scoreboard.qml
)

qt_add_resources(cuteoksa "res"
    PREFIX "/"
    FILES
        res/score.json
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(cuteoksa PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuntitled1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(cuteoksa
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS cuteoksa
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
