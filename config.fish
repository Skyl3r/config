#----------------------
#fish start- script |
#----------------------

# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG $HOME/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

#add typesafe activator to path
set -gx PATH ~/activator $PATH

#set default bd option to case insensitive (-i) implies seems mode (-s)
set -gx BD_OPT 'insensitive'

function cl -d "Change to directory and do ls"
    cd $argv; ls
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

echo "Here is a fortune for the hard times: "
echo ""
cowsay (fortune)
echo ""

