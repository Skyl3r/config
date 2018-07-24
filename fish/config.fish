#----------------------
#fish start- script |
#----------------------

set -gx PATH ~/bin $PATH

# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

#jenv path
set PATH $HOME/.jenv/bin $PATH

ulimit -n 4096

#this is broken
#set -gx LESSOPEN "| /usr/local/bin/src-hilite-lesspipe.sh %s"
#set -gx LESS " -R "

eval (thefuck --alias | tr '\n' ';')

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG $HOME/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

#set default bd option to case insensitive (-i) implies seems mode (-s)
set -gx BD_OPT 'insensitive'

function halp -d "Alias for fuck"
    fuck
end

function fucku -d "Alias for fuck -y"
    fuck -y
end

#rat alias
function rat -d "Runs rat"
    ~/go/bin/rat
end
#git/rat alias
function gitv -d "Runs rat also"
    rat
end

#mosh to asteria
function aster
	mosh bskcx@asteria.duckdns.org --ssh="ssh -p 56123"
end

#ip functions
function ip -d "Outputs local ip address"
    ifconfig | grep "broadcast" | awk '{print $2}'
end
function ipbc -d "Outputs broadcast line of ifconfig"
    echo "IP Broadcast:"
    ifconfig | grep "broadcast"
end

#git functions
function gcp -d "git commit and push"
    if count $argv > /dev/null
        git commit -m "$argv"
        git push
    else
        echo "Expected a commit message argument"
    end
end
function gacp -d "git add commit push"
    if count $argv > /dev/null
        git add *
        gcp "$argv"
    else
        echo "Expected a commit message argument"
    end
end

function gb -d "Prints ONLY current git branch"
    git branch | grep "\*" | awk '{print $2}'
end

function gbc -d "Copies ONLY current git branch"
    gb | pbcopy
end

#grep find in file
function fif -d "Find in files"
    grep -rni . -e "$argv" --exclude-dir='**/.*'
end

function l -d "Alias for less"
    less "$argv"
end

function kbdoff -d "Turn keyboard off"
    sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/
end

function kbdon -d "Turn keyboard on"
    sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/
end

function dui -d "Takes you to DUI source"
    echo 'WARPING TO DUI SOURCE'
    cd /Volumes/SourceCode/source/discoveryui
end
function ds -d "Takes you to DS source"
    echo 'WARPING TO DS SOURCE'
    cd /Volumes/SourceCode/source/discoveryservices
end
function dr -d "Takes you to DR source"
    echo 'WARPING TO DR SOURCE'
    cd /Volumes/SourceCode/source/deliveryresolver
end

#curl aliases
function cxml -d "Curls with Accept: application/xml"
    curl -H "Accept: application/xml" $argv
end

function cjson -d "Curls with Accept: application/json"
    curl -H "Accept: application/json" $argv
end

echo "           | keveloper |"

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
