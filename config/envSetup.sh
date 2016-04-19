#!/bin/bash

# Default args
COPY=false
UPDATE=false

# files=($(find -E $HOME/dev/scripts/config -type f -regex "^.*$"))
# for item in ${files[*]}
# do
#   printf "   %s\n" $item
# done
# echo ${files[1]}

# Parse args
for i in "$@"
do
case $i in
    -p=*|--maya=*)
    PREFIX="${i#*=}"

    ;;
    -s=*|--searchpath=*)
    SEARCHPATH="${i#*=}"
    ;;
    -l=*|--lib=*)
    DIR="${i#*=}"
    ;;
    -cp |--copy)
    COPY=true
    ;;
    -u |--update)
    UPDATE=true
    ;;
    *)
            # unknown option
    ;;
esac
done

if [ $UPDATE = true ]; then
	echo "Updating files from ${HOME} to ${DEV}/dev/scripts/config/home"
	cp -r $HOME/.profile $HOME/dev/scripts/config/home
	cp -r $HOME/.gitconfig $HOME/dev/scripts/config/home
	cp -r $HOME/.vim $HOME/dev/scripts/config/home
	cp -r $HOME/.vimrc $HOME/dev/scripts/config/home
fi

# export FABRICENGINE_VERSION=2.1.0
# export MAYA_VERSION=2016

# ### Fabric Engine environment variables ###
# # source /Users/danvas/dev/library/FabricEngine/${FABRICENGINE_VERSION}/environment.sh

# ### Maya environment variables and aliases ###
# export MAYA_LOCATION=/Applications/Autodesk/maya${MAYA_VERSION}/Maya.app/Contents
# export DYLD_LIBRARY_PATH=$MAYA_LOCATION/MacPorts
# export DYLD_FRAMEWORK_PATH=$MAYA_LOCATION/Frameworks
# alias mayapy='/Applications/Autodesk/maya${MAYA_VERSION}/Maya.app/Contents/bin/mayapy'
# alias maya='/Applications/Autodesk/maya${MAYA_VERSION}/Maya.app/Contents/bin/maya'
# alias Render='/Applications/Autodesk/maya2016/Maya.app/Contents/bin/Render'
