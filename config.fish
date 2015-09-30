#----------------------
#fish start-up script |
#----------------------

#add typesafe activator to path
set -gx PATH ~/activator $PATH

#-----FUNCTIONS-----------------
#"school alias" function
#navigates to current semester
function sa
    cd ~kevinholland/Documents/School/Current-Year4/Current-Semester1/
end

#starts pharos print authorization
#this must be running when printing using the Popup server
#this is a hack... something is wrong with how pharos installed
function print_auth
    /Library/Application\ Support/Pharos/Popup.app/Contents/MacOS/Popup
end

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
#get tomcat port
function tomcat_port
    cat /Library/Tomcat/conf/server.xml\
     | grep 'Connector' \
     | grep 'protocol=\"HTTP/1.1\"'\
     | awk '{print $2}'
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

