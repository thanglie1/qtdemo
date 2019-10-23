cmake_minimum_required(VERSION 3.1)

project(Demo_App_UI LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++0x")
set(Qt5_DIR D:/DevTool/Qt/5.12.3/msvc2017_64/lib/cmake/Qt5)
set(Qt5Quick_DIR D:/DevTool/Qt/5.12.3/msvc2017_64/lib/cmake/Qt5Quick)
set(Qt5Qml_DIR D:/DevTool/Qt/5.12.3/msvc2017_64/lib/cmake/Qt5Qml)
set(Qt5Network_DIR D:/DevTool/Qt/5.12.3/msvc2017_64/lib/cmake/Qt5Network)
set(Qt5Gui_DIR D:/DevTool/Qt/5.12.3/msvc2017_64/lib/cmake/Qt5Gui)
set(Qt5Core_DIR D:/DevTool/Qt/5.12.3/msvc2017_64/lib/cmake/Qt5Core)
set(Qt5Widgets_DIR D:/DevTool/Qt/5.12.3/msvc2017_64/lib/cmake/Qt5Widgets)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt5Core REQUIRED)
find_package(Qt5Network REQUIRED)
find_package(Qt5Widgets REQUIRED)


include_directories(../MessagingAppFramework/include)
include_directories(../gears-service)

add_executable(${PROJECT_NAME}
    "main.cpp"
    "qml.qrc"
    "Controller.h"
	"Controller.cpp"
    )
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick Qt5::Widgets)
