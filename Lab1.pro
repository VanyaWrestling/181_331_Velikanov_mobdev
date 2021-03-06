QT += quick network
QT += charts
QT += sql
QT += websockets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
#DEPENDPATH += C:\Qt\Tools\OpenSSL\Win_x64\include
#INCLUDEPATH += C:\Qt\Tools\OpenSSL\Win_x64\include

# подключение библиотек для WIN
INCLUDEPATH += C:\OpenSSL-Win64\include
LIBS +=	-LC:\OpenSSL-Win64\lib\ -llibeay32 -lssleay32 -lubsec

#LIBS += C:\Qt\Tools\OpenSSL\Win_x64\lib\libcrypto.lib

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        cryptocontroller.cpp \
        httpcontroller.cpp \
        mailmodel.cpp \
        main.cpp

RESOURCES += qml.qrc
QT += multimedia multimediawidgets
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    cryptocontroller.h \
    httpcontroller.h \
    mailmodel.h
