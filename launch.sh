#!/bin/bash

if [ -f /usr/bin/python3 ];then
  MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
  cd "$MY_PATH"
  echo "$MY_PATH"
else
  echo "Python 3 is not installed or isn't in PATH!!!"
  exit 1
fi

HTTP_PORT=$1
if [ $# -lt 1 ]
then
    echo "Port not specified, using port 8080"
    HTTP_PORT=8080
fi  

if [ -f /usr/bin/lxterminal ];then
  lxterminal --title="WebDesk IDB development HTTP server" -e bash -c "python3 -m http.server $HTTP_PORT"
elif [ -f /usr/bin/xfce4-terminal ];then
  xfce4-terminal --title="WebDesk IDB development HTTP server" -x bash -c "python3 -m http.server $HTTP_PORT"
elif [ -f /usr/bin/mate-terminal ];then
  #mate-terminal --title="WebDesk IDB development HTTP server" -e "bash -c "\""python3 -m http.server $HTTP_PORT"\"""
  mate-terminal --title="WebDesk IDB development HTTP server" -x bash -c "python3 -m http.server $HTTP_PORT"
elif [ -f /usr/bin/xterm ];then
  xterm -T "WebDesk IDB development HTTP server" -e bash -c "python3 -m http.server $HTTP_PORT"
elif [ -f /usr/bin/konsole ];then
  konsole -p tabtitle="WebDesk IDB development HTTP server" -e bash <(echo "python3 -m http.server $HTTP_PORT")
elif [ -f /usr/bin/terminator ];then
  terminator -T "WebDesk IDB development HTTP server" -x bash -c "python3 -m http.server $HTTP_PORT"
  # note that the modern GNOME Console app (aka kgx) dosen't close after a command exits so the user will have to manually close it after an update is done
elif [ -f /usr/bin/kgx ];then
  kgx --title "WebDesk IDB development HTTP server" -e "bash -c 'python3 -m http.server $HTTP_PORT'"
elif [ -f /usr/bin/gnome-terminal ];then
  gnome-terminal --title "WebDesk IDB development HTTP server" -x bash -c "python3 -m http.server $HTTP_PORT"
elif [ -f /usr/bin/x-terminal-emulator ];then
  $(readlink -f /usr/bin/x-terminal-emulator) -e bash -c "python3 -m http.server $HTTP_PORT" 
else
  echo "Failed to locate any terminal emulators, falling back running without a virtual terminal"
  python3 -m http.server $HTTP_PORT
fi