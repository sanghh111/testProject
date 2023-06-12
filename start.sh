echo "Loading the latest version"
FILE=/home/testProject/pid/testProject
if [ -f "$FILE" ]; then
    kill $(cat /home/testProject/pid/testProject) || {
        Port=3000
        pid=`ps ax | grep gunicorn | grep $Port | awk '{split($0,a," "); print a[1]}' | head -n 1`
        if [ -z "$pid" ]; then
            echo "Server is stopping"
        else
            echo "Server is stopping"
            rm -f /home/oncheck/pid/oncheck
            kill $pid
        fi
    }
    echo "Server is restarting"
else 
    echo "Server is starting"
fi

eval "$(conda shell.bash hook)"
source venv/bin/activate
gunicorn --pid /home/testProject/pid/testProject --bind 127.0.0.1:3000 --workers 1 --timeout 300 core.wsgi --daemon
