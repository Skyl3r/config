function sa
    cd ~kevinholland/Documents/School/Current-Year4/Current-Semester1/
end

function print_auth
    /Library/Application\ Support/Pharos/Popup.app/Contents/MacOS/Popup
end

set -gx PATH ~/activator $PATH

#mysql functions
function mysql_start
    /Library/MySQL/bin/mysql.server start
end
function mysql_stop
    /Library/MySQL/bin/mysql.server stop
end

#tomcat functions
function tomcat_start
    /Library/Tomcat/bin/startup.sh
end
function tomcat_stop
    /Library/Tomcat/bin/shutdown.sh
end

#web servers
function webserv_start
    /Library/Tomcat/bin/startup.sh
    /Library/MySQL/bin/mysql.server start
end
function webserv_stop
    /Library/Tomcat/bin/shutdown.sh
    /Library/MySQL/bin/mysql.server stop
end

#ip functions
function ip
    ifconfig | grep "broadcast" | awk '{print $2}'
end
function ipbc
    echo "IP Broadcast:"
    ifconfig | grep "broadcast"
end
