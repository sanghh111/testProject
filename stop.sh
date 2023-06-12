kill $(cat /home/testProject/pid/testProject) || {
    Port=3000
    pid=`ps ax | grep gunicorn | grep $Port | awk '{split($0,a," "); print a[1]}' | head -n 1`
    if [ -z "$pid" ]; then
        echo "Server is stopping"
    else
        echo "Server is stopping"
        rm -f /home/testProject/pid/testProject
        kill $pid
    fi
}

echo "Server is stopped"