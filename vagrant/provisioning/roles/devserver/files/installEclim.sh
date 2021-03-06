#!/usr/bin/env bash

Xvfb :1 -screen 0 1024x768x24 &

DISPLAY=:1 ./eclipse/eclipse -nosplash -consolelog -debug \
    -application org.eclipse.equinox.p2.director \
    -repository http://download.eclipse.org/releases/mars/ \
    -installIU org.eclipse.wst.web_ui.feature.feature.group

DISPLAY=:1 ./eclipse/eclipse -nosplash -consolelog -debug \
    -application org.eclipse.equinox.p2.director \
    -repository http://dist.springsource.org/snapshot/GRECLIPSE/e4.5/ \
    -installIU org.codehaus.groovy.eclipse.feature.feature.group

DISPLAY=:1 ./eclipse/eclipse -nosplash -consolelog -debug \
    -application org.eclipse.equinox.p2.director \
    -repository http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site \
    -installIU org.scala-ide.sdt.feature.feature.group

#DISPLAY=:1 ./eclipse/eclimd -b
