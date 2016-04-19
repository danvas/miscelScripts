export DEV_HOME=$HOME/dev
export DEV_TMP=$DEV_HOME/tmp

### Versions ###
export FABRICENGINE_VERSION=2.1.0
export MAYA_VERSION=2016

### Fabric Engine environment variables ###
# source /Users/danvas/dev/library/FabricEngine/${FABRICENGINE_VERSION}/environment.sh

### Maya environment variables and aliases ###
export MAYA_LOCATION=/Applications/Autodesk/maya${MAYA_VERSION}/Maya.app/Contents
export DYLD_LIBRARY_PATH=$MAYA_LOCATION/MacPorts
export DYLD_FRAMEWORK_PATH=$MAYA_LOCATION/Frameworks
alias mayapy='/Applications/Autodesk/maya${MAYA_VERSION}/Maya.app/Contents/bin/mayapy'
alias maya='/Applications/Autodesk/maya${MAYA_VERSION}/Maya.app/Contents/bin/maya'
alias Render='/Applications/Autodesk/maya2016/Maya.app/Contents/bin/Render'

### Python alias'
alias ipython='python -m IPython'

# Setting PATH for EPD_free-7.3-2
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
# export PATH

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home"

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
# export PATH

# Setting Renderman variables
# export RMANTREE=/Applications/Pixar/RenderManProServer-19.0
# PATH="$RMANTREE/bin:${PATH}"
# export PATH




### Start Piperita Theme ###
# Theme by Jacob Tomlinson
# https://github.com/killfall/terminal-piperita

# Aliases to make ls easier to use in different modes, taken from Red Hat EL 6
alias ls='ls -GFh'
alias ll="ls -ll"
alias la="ll -a"

# Alias to restart MagicPrefs
alias magicprefsrestart="killall MagicPrefs; echo 'MagicPrefs killed'; open -a MagicPrefs; echo 'MagicPrefs launched. Done.'"

# Set ls colors
export LSCOLORS=ExFxBxDxCxegedabagacad 

# Alias to set color in grep
alias grep="grep --color=auto"
         
# Environment variables to set prompt format and color 
export COLOR_BOLD="\[\e[1m\]"
export COLOR_DEFAULT="\[\e[0m\]"

# Test if user is root and set user color appropriately
if [[ $(id -u) == 0 ]]
then
    export PS1USERCOLOR="\[\033[31m\]"
else
    export PS1USERCOLOR="\[\033[36m\]"
fi

# get current branch in git repo
function parse_git_branch() {
        BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        if [ ! "${BRANCH}" == "" ]
        then
                STAT=$(parse_git_dirty)
                echo " [${BRANCH}${STAT}]"
        else
                echo ""
        fi
}

# get current status of git repo
function parse_git_dirty {
        status=$(git status 2>&1 | tee)
        dirty=$(echo -n "${status}" 2> /dev/null | grep "modified:" &> /    dev/null; echo "$?")
        untracked=$(echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
        ahead=$(echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
        newfile=$(echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
        renamed=$(echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
        deleted=$(echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")
        bits=''
        if [ "${renamed}" == "0" ]; then
                bits=">${bits}"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="*${bits}"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="+${bits}"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="?${bits}"
        fi
        if [ "${deleted}" == "0" ]; then
                bits="x${bits}"
        fi
        if [ "${dirty}" == "0" ]; then
                bits="!${bits}"
        fi
        if [ ! "${bits}" == "" ]; then
                echo " ${bits}"
        else
                echo ""
        fi
}

export PS1="$PS1USERCOLOR\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[33;1m\]\W\`if type parse_git_branch > /dev/null 2>&1; then parse_git_branch; fi\`\`if [ \$? = 0 ]; then echo -e '\[\033[m\]\$'; else echo -e '\[\e[31m\]\$'; fi\` \[\033[m\]"

export CLICOLOR=1

### End Piperita Theme ###

##
# Your previous /Users/danvas/.profile file was backed up as /Users/danvas/.profile.macports-saved_2015-07-29_at_18:35:59
##

# MacPorts Installer addition on 2015-07-29_at_18:35:59: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Copies the contents of a file to the clipboard
function copytoclipboard { cat "$1" | pbcopy; }
export -f copytoclipboard



# RetroPie
alias sshretropie='ssh pi@192.168.10.104'
alias scpretro='scp $1 pi@192.168.10.104:$2'



