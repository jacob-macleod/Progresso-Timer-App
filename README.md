# progresso

A timer made with Flutter

## Overview
This application is still in development. At the moment, the following features have been developed:
* The ability to set a time
* The ability to start, stop, and pause a timer
* Once timers are finished, the user is taken to a screen and sound is played

Several features are planned to be implemented, like notifications and timer presets

## Errors encountered
When I added firebase support, I had an error while compiling the project. I fixed this after changing `classpath com.google.gms:google-services:4.3.10` to `classpath com.google.gms:google-services:4.3.14` in `build.gradle`