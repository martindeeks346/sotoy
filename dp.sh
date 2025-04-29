echo Downloading
apt update -y 
apt install xvkbd nano icewm tightvncserver autocutsel lxterminal xarchiver tmux screen ssh git pcmanfm okular -y > /dev/null
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sleep 2 && sudo dpkg -i google-chrome-stable_current_amd64.deb
apt install -f -y
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
echo 'deb http://download.opensuse.org/repositories/home:/hawkeye116477:/waterfox/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:hawkeye116477:waterfox.list 
curl -fsSL https://download.opensuse.org/repositories/home:hawkeye116477:waterfox/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_hawkeye116477_waterfox.gpg > /dev/null 
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y 
sudo apt update
sudo apt install playit -y
sudo apt install waterfox-g-kde -y
sudo apt install firefox-trunk -y

mkdir -p "$HOME/.vnc"
sleep 1 && echo qwerty1234 | vncpasswd -f > /root/.vnc/passwd
sleep 1 && chown -R root:root /root/.vnc
sleep 1 && chmod 0600 /root/.vnc/passwd

sleep 1 && sudo tightvncserver -geometry 1280x720 :7 > /dev/null
sleep 1 && sudo tightvncserver -kill :7
sleep 1 && sed -i "2i autocutsel -s CLIPBOARD -fork" ~/.vnc/xstartup
sleep 1 && sed -i "3i autocutsel -s PRIMARY -fork" ~/.vnc/xstartup
sleep 1 && sudo tightvncserver -geometry 1280x700 :7 > /dev/null
