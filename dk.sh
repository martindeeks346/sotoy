echo Downloading
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y 
sudo apt update
sudo apt install firefox-trunk -y

mkdir -p "$HOME/.vnc"
sleep 1 && mkdir /home/user1/.vnc 
sleep 1 && mkdir /home/user2/.vnc
sleep 1 && mkdir /home/user3/.vnc
sleep 1 && echo 71913622 | vncpasswd -f > /root/.vnc/passwd
sleep 1 && echo 71913622 | vncpasswd -f > /home/user1/.vnc/passwd 
sleep 1 && echo 71913622 | vncpasswd -f > /home/user2/.vnc/passwd 
sleep 1 && echo 71913622 | vncpasswd -f > /home/user3/.vnc/passwd 
sleep 1 && chown -R root:root /root/.vnc
sleep 1 && chown -R user1:user1 /home/user1/.vnc
sleep 1 && chown -R user2:user2 /home/user2/.vnc
sleep 1 && chown -R user3:user3 /home/user3/.vnc
sleep 1 && chmod 0600 /root/.vnc/passwd
sleep 1 && chmod 0600 /home/user1/.vnc/passwd
sleep 1 && chmod 0600 /home/user2/.vnc/passwd
sleep 1 && chmod 0600 /home/user3/.vnc/passwd

sleep 1 && sudo tightvncserver -geometry 1280x720 :7 > /dev/null
sleep 1 && sudo tightvncserver -kill :7
sleep 1 && sed -i "2i autocutsel -s CLIPBOARD -fork" ~/.vnc/xstartup
sleep 1 && sed -i "3i autocutsel -s PRIMARY -fork" ~/.vnc/xstartup
sleep 1 && sudo tightvncserver -geometry 1280x700 :7 > /dev/null
