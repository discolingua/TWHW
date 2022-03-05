#!/bin/bash

APPLICATION_PATH="/Applications/Godot_mono.app/Contents/MacOS/"
EXPORT_PATH="/Users/bunny/Development/godot/Export/TWHW/"

rm -rf ${EXPORT_PATH}
mkdir ${EXPORT_PATH}
${APPLICATION_PATH}Godot --no-window --export HTML5 ${EXPORT_PATH}
