echo Downloading
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y 
sudo apt update
sudo apt install playit -y
sudo apt install firefox-trunk -y

sleep 1 && sudo tightvncserver -geometry 1280x720 :7 > /dev/null
sleep 1 && sudo tightvncserver -kill :7
sleep 1 && sed -i "2i autocutsel -s CLIPBOARD -fork" ~/.vnc/xstartup
sleep 1 && sed -i "3i autocutsel -s PRIMARY -fork" ~/.vnc/xstartup
sleep 1 && sudo tightvncserver -geometry 1280x700 :7 > /dev/null
