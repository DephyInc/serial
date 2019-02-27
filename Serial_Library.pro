#-------------------------------------------------
#
# Project created by QtCreator 2019-02-27T09:48:25
#
#-------------------------------------------------

QT       -= core gui

TARGET   = serialc
TEMPLATE = lib
CONFIG  += staticlib

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH +=  include      \
                include/serial \
                include/serial/impl

SOURCES += \
    src/impl/list_ports/list_ports_linux.cc \
    src/impl/list_ports/list_ports_osx.cc \
    src/impl/list_ports/list_ports_win.cc \
    src/impl/unix.cc \
    src/impl/win.cc \
    src/revision.cpp \
    src/serial.cc

HEADERS += \
    include/serial/impl/unix.h \
    include/serial/impl/win.h \
    include/serial/serial.h \
    include/serial/v8stdint.h \
    include/git_rev_data.h \
    include/revision.h
unix {
    target.path = /usr/lib
    INSTALLS += target
}

