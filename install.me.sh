#!/bin/bash
# install smx, gamedata and others into addons/sourcemod
# Assumes Sourcemod 1.10+ and 64 bit Linux OS (or WSL)

ROOT="../../plugins/addons/sourcemod"
SM_GAMEDATA="${ROOT}/gamedata"
SM_SCRIPTING="${ROOT}/scripting"
SM_PLUGINS="${ROOT}/plugins"
SM_DATA="${ROOT}/data"

cp -rf sourcemod/plugins/* ${SM_PLUGINS}/
cp -rf sourcemod/scripting/* ${SM_SCRIPTING}/
cp -rf sourcemod/gamedata/* ${SM_GAMEDATA}/
cp -rf sourcemod/data/* ${SM_DATA}/
