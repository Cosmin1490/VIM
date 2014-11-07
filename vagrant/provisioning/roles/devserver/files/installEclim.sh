#!/usr/bin/env bash

Xvfb :1 -screen 0 1024x768x24 &

DISPLAY=:1 ./eclipse/eclipse -nosplash -consolelog -debug \
  -application org.eclipse.equinox.p2.director \
  -repository http://download.eclipse.org/releases/luna \
  -installIU org.eclipse.wst.web_ui.feature.feature.group

DISPLAY=:1 ./eclipse/eclipse -nosplash -consolelog -debug \
  -application org.eclipse.equinox.p2.director \
  -repository http://download.eclipse.org/releases/luna \
  -installIU org.eclipse.jdt.feature.group

DISPLAY=:1 ./eclipse/eclipse -nosplash -consolelog -debug \
  -application org.eclipse.equinox.p2.director \
  -repository http://download.scala-ide.org/sdk/lithium/e44/scala211/dev/site \
  -installIU org.scala-ide.sdt.feature.feature.group

java \
  -Dvim.skip=true \
  -Declipse.home=/home/vagrant/eclipse \
  -jar eclim_2.5.5.jar install
