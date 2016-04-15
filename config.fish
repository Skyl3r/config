#----------------------
#fish start-up script |
#----------------------

#add typesafe activator to path
set -gx PATH ~/activator $PATH

#-----FUNCTIONS-----------------
#"school alias" function
#navigates to current semester
function sa -d "Navigates to current semester directory"
    cd ~kevinholland/Documents/School/Current-Year4/Current-Semester1/
end

function cl -d "Change directory and list"
    cd $argv; ls
end

#mysql functions
function mysql_start -d "Starts mysql server"
    /Library/MySQL/bin/mysql.server start
end
function mysql_stop -d "Stops mysql server"
    /Library/MySQL/bin/mysql.server stop
end

#tomcat functions
function tomcat_start -d "Starts tomcat instance"
    /Library/Tomcat/bin/startup.sh
end
function tomcat_stop -d "Stops tomcat instance"
    /Library/Tomcat/bin/shutdown.sh
end
#get tomcat port
function tomcat_port -d "Returns tomcat port instance from server.xml"
    cat /Library/Tomcat/conf/server.xml\
     | grep 'Connector' \
     | grep 'protocol=\"HTTP/1.1\"'\
     | awk '{print $2}'\
     | sed 's/[^0-9]//g'
end
#check tomcat status (localhost:9080)
function tomcat_status -d "Hits localhost:{port} and outputs response"
    echo "tomcat status:"
    tomcat_port | read port
    curl -s -o /dev/null -w " ->%{url_effective}\n <-%{http_code}\n" localhost:"$port"
end

#web servers
function webserv_start -d "Starts tomcat and mysql"
    echo "Starting web servers"
    /Library/Tomcat/bin/startup.sh
    /Library/MySQL/bin/mysql.server start
    echo "Success"
end
function webserv_stop -d "Stops tomcat and mysql"
    echo "Stopping web servers"
    /Library/Tomcat/bin/shutdown.sh
    /Library/MySQL/bin/mysql.server stop
    echo "Success"
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

