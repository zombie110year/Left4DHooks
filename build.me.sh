#!/bin/bash
# Compile plugins
# Assumes Sourcemod 1.10+ and 64 bit Linux OS (or WSL)

SRC_DIR="./sourcemod/scripting/"
OUTPUT_DIR="./sourcemod/plugins"
SRCMOD_ROOT="../../plugins/addons/sourcemod/"
SRCMOD_COMPILER="spcomp64"

test -e $OUTPUT_DIR || mkdir $OUTPUT_DIR

SRCMOD_COMPILE="$(cd $SRCMOD_ROOT ; pwd)/scripting/$SRCMOD_COMPILER"
SRCMOD_INC="$(cd $SRCMOD_ROOT ; pwd)/scripting/include"
SRC_INC="$(cd $SRC_DIR/include ; pwd)"
SRCMOD_COMPILE_CMD="$SRCMOD_COMPILE -i$SRC_INC -i$SRCMOD_INC -D$(cd $SRC_DIR ; pwd) "
SRCMOD_OUTPUT_DIR="$(cd $OUTPUT_DIR ; pwd)"

echo "src.include = $SRC_INC"
echo "Sourcemod.include = $SRCMOD_INC"
echo "Sourcemod.compiler = $SRCMOD_COMPILE"
echo "Sourcemod.compile_cmd = $SRCMOD_COMPILE_CMD"
echo "Sourcemod.output_dir = $SRCMOD_OUTPUT_DIR"

srcmod_compile () {
	sourcefile=$1
	echo -e "\nCompiling $sourcefile ..."
	smxfile="`echo $sourcefile | sed -e 's/\.sp$/\.smx/'`"
	$SRCMOD_COMPILE_CMD $sourcefile -o$SRCMOD_OUTPUT_DIR/$smxfile
}

srcmod_compile left4dhooks.sp

