sudo apt update
cd /etc/apt
ls
vi sources.list
sudo apt install git --no-install-recommends
ls
cd apt.conf.d/
ls
nano 99no-recommends
sudo nano 99no-recommends
sudo apt update
sudo apt list --upgradable
sudo apt-get upgrade
apt list --installed
apt list --installed | grep wifi
sudo apt update
ls
cd ../
sudo cp sources.list sources.list.bk
sudo nano sources.list
ls
cat sources.list
sudo apt-get update
ping 8.8.8.8
ip a
ping 8.8.8.8
sudo ifup enp0s31f6
sudo ifup eth0
sudo reboot
sudo systemctl enable systemd-networkd
cd /etc/systemd/
ls
cat network.conf
cat networkd.conf
cd network
ls
ls -a
cd ../
apt list --installed | grep wpa
cd network
ls
sudo nano 20-wired.network
ip a
sudo nano 20-wired.network
ip a
sudo nano 20-wired.network
ip a
sudo nano 20-wired.network
sudo systemctl restart systemd-networkd
ping 8.8.8.8
sudo reboot
ping 8.8.8.8
sudo apt update
sudo apt upgrade
wpa_cli
cd /etc/apt
sudo rm sources.list
sudo mv sources.list.bk sources.list
ls -a
cd /
ls
ls /sys/firmware/efi/
ls efivars
cd ../
ls /sys/firmware/efi/efivars/
cd boot/
ls
cd efi/
ls
sudo cd efi/
sudo su
cd /boot/efi/
sudo su
cd /boot/efi
sudo du
sudo su
cd /boot
sudo su
sudo bootctl update
sudo su
bootctl --path=/boot install
sudo bootctl --path=/boot install
cd /boot
sudo su
sudo reboot
sudo apt install git
sudo apt install xorg suckless-tools mpv 
sudo apt install pass 
sudo apt install xwallpaper xclip
ls
ls -a
vi .xinitrc
sudo apt install dunst compton
ssh axel@192.168.1.35
sudo apt install ssh
ssh axel@192.168.1.35
git clone https://github.com/axelcalixte/dotfiles
apt search certificate
apt search certificate | less
sudo apt install ca-certificates
git clone https://github.com/axelcalixte/dotfiles
sudo apt install stow
cd dotfiles/
ls
stow git
cd ../
ls
ls -a
rm .gitconfig 
cd dotfiles/
stow git
cd ../
ls
ls -a
cd .profile 
vi .profile
cd dotfiles/
ls
stow st dwm
cd ../
startx
dwm
cd .local/share/dwm
sudo make clean install
sudo apt install build-essentials
sudo apt install essentials
apt search essential
apt search essential | less
sudo apt install build-essential
cd ../st/
sudo make clean install
sudo apt install libx11-dev
sudo make clean install
sudo apt install libxft-dev
sudo make clean install
cd ../dwm
sudo make clean install
sudo apt install libxinerama-dev
sudo make clean install
cd ../../../
startx
vi .xinitrc 
sudo apt install dunst compton
sudo reboot
sudo apt autopurge firefox-esr
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
sudo apt autopurge firefox-esr
sudo apt install vscodium
sudo apt update && sudo apt install codium
ls
cd dotfiles/
ls
stow keepassxc
cd ../
sudo apt install keepassxc
sudo apt install telegram-desktop
sudo apt install firefox-esr
sudo echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Raspbian_Buster/ /' > /etc/apt/sources.list.d/home:ungoogled_chromium.list
sudo su
wget -nv https://download.opensuse.org/repositories/home:ungoogled_chromium/Raspbian_Buster/Release.key -O Release.key
sudo apt install wget
wget -nv https://download.opensuse.org/repositories/home:ungoogled_chromium/Raspbian_Buster/Release.key -O Release.key
apt-key add - < Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install ungoogled-chromium
sudo apt update
sudo apt-get install ungoogled-chromium
echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Buster/ /' > /etc/apt/sources.list.d/home:ungoogled_chromium.list
sudo echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Buster/ /' > /etc/apt/sources.list.d/home:ungoogled_chromium.list
sudo su
chromium
sudo apt install ungoogled-chromium-sandbox
chromium
xwallpaper
xwallpaper --zoom Images/wallhaven-5w6319_1280x720.png 
vi .xinitrc 
sudo apt install youtube-dl
mpv https://invidio.us/watch?v=QNpgxzRGuQE
sudo apt install alsamixer
sudo apt install alsa
sudo apt install amixer
sudo apt install alsa-tools
amixer
alsamixer
sudo apt install alsa-utils
sudo apt autopurge alsa-tools
alsamixer
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo apt install curl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo apt autopurge youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
youtube-dl
mpv https://invidio.us/watch?v=QNpgxzRGuQE
cd /sys/
ls
cd power/
ls
cd ../
ls
cd class/
ls
cd power_supply/
ls
cd BAT1
ls
cat capacity_level
cat energy_now
cat capacity
cat power_now
cat status
sudo apt install ufw
sudo apt install tlp
cd ~
ls
rm Release.key 
sudo apt key list
sudo apt-key list
sudo apt-key list | less
sudo apt-key list | grep Raspbian
sudo apt-key list | less
sudo apt install syncthing
cd .local/share/
git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard/
sudo make install
cd ~
sudo apt install neomutt isync msmtp lynx notmuch abook pamgnupg
sudo apt install neomutt isync msmtp lynx notmuch abook pamg-nupg
sudo apt install neomutt isync msmtp lynx notmuch abook pam-gnupg
sudo apt install neomutt isync msmtp lynx notmuch abook
mw add
gpg --gull-gen-key
gpg --full-gen-key
mw add
pass init axelcalixte@disroot.org
mw add
mbsync disroot utt cock-li
neomutt
cd .local/share/
ls
ip a
cd /etc/systemd/
ls
cd network
ls
sudo nvim 20-wired.network 
wpa
iwlist scan
sudo apt install wpa_supplicant
sudo wpa_cli
sudo iwlist scan
sudo reboot
startx
sudo iwlist scan
wpa_cli
sudo wpa_cli
man wpa_cli
cd /etc/systemd/network
ls
cat 25-wireless.netowrk 
cd 20-wired.network 
cat 20-wired.network 
ping 8.8.8.8
sudo iwlist scan
ip a
sudo systemctl enable systemd-networkd.service
sudo systemctl disable systemd-networkd
sudo systemctl enable systemd-networkd
sudo systemctl stop systemd-networkd
sudo systemctl stop systemd-networkd.socket
sudo systemctl start systemd-networkd
ping 8.8.8.8
sudo iwlist scan
wpa_cli
sudo wpa_cli
sudo networkctl
man networkctl 
sudo networkctl status
sudo wpa_passphrase Livebox-16A3-5GHZ Yoshibleu72
wpa_supplicant -B -i wlp3s0 -c <(wpa_passphrase Livebox-16A3-5GHZ Yoshibleu72)
sudo wpa_supplicant -B -i wlp3s0 -c <(wpa_passphrase Livebox-16A3-5GHZ Yoshibleu72)
networkctl
sudo su
cd /etc/wpa_supplicant/
ls
cat functions.sh 
ls
sudo vi wpa_supplicant.conf
sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
wpa_cli
sudo wpa_cli
sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
ls
ls -a
sudo reboot
ls
cd /etc/wpa_supplicant/
ls
cat wpa_supplicant.conf 
sudo vi wpa_supplicant.conf 
wpa_passphrase Livebox-16A3-5GHZ Yoshibleu72 > /etc/wpa_supplicant/example.conf
sudo wpa_passphrase Livebox-16A3-5GHZ Yoshibleu72 > /etc/wpa_supplicant/example.conf
sudo su
vi example.conf 
sudo vi example.conf 
ls
sudo rm example.conf 
sudo systemctl enable wpa_supplicant@wpa_supplicant.service
sudo systemctl start wpa_supplicant@wpa_supplicant.service
sudo reboot
ip link
sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
sudo wpa_cli
startx
ip a
systemd-analyze
systemd-analyze blame
networkctl
wpa_cli
sudo wpa_cli
cd /etc/wpa_supplicant/
ls
sudo mw wpa_supplicant.conf home.conf
sudo mv wpa_supplicant.conf home.conf
ls
sudo systemctl disable wpa_supplicant
sudo systemctl disable wpa_supplicant@wpa_supplicant.service
sudo systemctl start wpa_supplicant@home.service
journalctl -xe
sudo journalctl -xe
sudo systemctl enable wpa_supplicant
sudo systemctl start wpa_supplicant@home.service
sudo systemctl start wpa_supplicant
sudo systemctl start wpa_supplicant@home.service
sudo systemctl disable wpa_supplicant
sudo systemctl disable wpa_supplicant@home.service
ls
ip a
sudo mv home.conf wpa_supplicant-wlp3s0.conf
cd wpa_supplicant-wlp3s0.conf 
sudo vi wpa_supplicant-wlp3s0.conf 
sudo wpa_supplicant Livebox-16A3-5GHZ Yoshibleu72 >> wpa_supplicant-wlp3s0.conf 
sudo su
sudo vi wpa_supplicant-wlp3s0.conf 
sudo su
vi wpa_supplicant-wlp3s0.conf 
wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf 
sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf 
ping 8.8.8.8
ping gnu.org
tlp
nmtui
sudo nmtui
sudo apt install tlp
apt list --installed | grep nm
apt list --installed | grep network
cd /etc/systemd/
ls
cat networkd.conf 
cd network
ls
ping 8.8.8.8
mv 20-wired.network 20-wired.network.bk
sudo mv 20-wired.network 20-wired.network.bk
sudo mv 25-wireless.netowrk 25-wireless.netowrk.bk
ls
sudo systemctl disable systemd-networkd
sudo reboot
cd /etc/wpa_supplicant/
ls
cat wpa_supplicant-wlp3s0.conf 
systemd-analyze blame
sudo wpa_supplicant -B -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf 
ping 8.8.8.8
ip a
startx
sudo wpa_cli
ls
ping 8.8.8.8
ip a
cd /etc/systemd/network
sudo mv 20-wired.network.bk 20-wired.network
sudo systemctl start systemd-netword
sudo systemctl start systemdnetword
sudo systemctl start systemd.netword
sudo systemctl start systemd-networkd
ip a
ifup enp0s31f6
sudo ifup enp0s31f6
ping 8.8.8.8
sudo systemctl stop systemd-networkd 
sudo systemctl stop wpa_supplicant
sudo systemctl disable wpa_supplicant
sudo apt install networkmanager
sudo apt install NetworkManager
apt search networkmanager
apt search Networkmanager
apt search Network
apt search network manager
apt search network manager | less
sudo apt install network-manager
sudo apt update
sudo start systemd-networkd
sudo systemctl start systemd-networkd
sudo apt update
sudo apt install network-manager
sudo systemctl enable network-manager
sudo systemctl enable networkmanager
nmtui
sudo reboot
nmcli
nmtui
systemd-analyze blame
sudo systemctl disable wpa_supplicant.service
sudo systemctl disable networking.service
sudo reboot
cd ~
ssh axel@192.168.1.35
sudo apt install desmume
sudo apt install neofetch
neofetch
cd ~
cd 
cd Downloads/
ls
chromium file://extension_1_26_0_0.crx
mkdir Musique
ls
cd Musique/
ls
cd ../Documents/keepass/
ls
rm versbitwarden 
sudo apt install arandr
arandr
sudo apt autopurge arandr
sudo apt install xautolock
man xautolock
cd ~
vi .xinitrc 
man xautolock
vi .xinitrc 
man xautolock
vi .xinitrc 
xautolock -time 1 -locker slock -corners ----
xautolock -time 1 -locker slock -corners ---- &
systemd-analyze blame
systemd-analyze
ssh-agent
cd ~
cd dotfiles/
ls
sudo apt install zsh
stow zsh
apt search zsh
sudo apt install zsh
cd zsh/
ls
cd .config/
ls
cd zsh/
ls
ls -a
cd ../
ls
cd ../.local/
ls
cd share/
ls
cd zsh/
ls
cd plugins/
ls
cd ..
cd ~
ls
zsh
cd dotfiles/
ls
cd zsh/
ls
ls -a
cd ../
git submodule
vi .gitmodules 
git status
git add .gitmodules 
cd zsh/.local/share/zsh/plugins/
ls
cd fast-syntax-highlighting/
ls
ls -a
cd ~/dotfiles/
git submodule add git@github.com:zdharma/fast-syntax-highlighting.git zsh/.local/share/zsh/plugins/fast-syntax-highlighting/
rm -rf zsh/.local/share/zsh/plugins/
cd zsh/
ls
cd .local/share/zsh/
ls
cd ../../../
sudo apt install scp
scp
cd ~
ssh axel@192.168.1.35
scp axel@192.168.1.35:/home/axel/.ssh/authorized_keys /home/axel/.ssh
cd .ssh
ls
cat known_hosts 
rm known_hosts 
scp axel@192.168.1.35:/home/axel/.ssh/known_hosts /home/axel/.ssh
cd ..
ssh-keygen -t rsa -b 4096 -C "axelcalixte@disroot.org"
syncthing
ssh-keygen -t rsa -b 4096 -C "axelcalixte@disroot.org"
ssh-agent
ssh-add ~/.ssh/id_rsa
cd ~
eval "$(ssh-agen -s)"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh-keygen -t rsa -b 4096 -C "axelcalixte@disroot.org"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
ssh -T git@github.com
ssh-keygen -p
zsh
poweroff
systemctl poweroff
ls
htop
sudo apt install htop
htop
ping 8.8.8.8
cd /etc/systemd/network
ls
sudo mv 20-wired.network 20-wired.network.bk
startx
sudo apt update
nmtui
sudo apt update
sudo apt install codium
codium
htop
ls -a
ls
ls -a
vi .profile 
echo $EDITOR
source .profile
echo $EDITOR
vi .profile 
source .profile 
cat .notmuch-config 
mv .notmuch-config .config/notmuch-config
ls -A
mv .password-store/ .local/share/password-store
cd .local/share/password-store/
ls
cd ../
ls
cd ~
ls
ls -A
rm -rf Sync/
vi .profile 
ls -A
mv .gnupg/ .local/share/gnupg/
ls -A
rm -rf .mozilla/
rm -rf .screenlayout/
rm .wget-hsts 
rm .Xauthority 
ls -A
zsh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
cd .cache/dein/repos/github.com/Shougo/dein.vim/
ls
cd ../../
ls
cd ../
ls
cd ./
ls
cd ../
ls
vi
sudo apt autopurge xfce4-terminal
nvim
cd dotfiles/
ls
stow nvim
cd ../
nvim .config/nvim/init.vim 
cd dotfiles/
cd dein/.cache/dein/repos/github.com/Shougo/dein.vim/
ls
ls -a
cd ../../../../
ls
cd ../../
ls
cd ../
git submodule
git submodule status
stow dein
cd ../
v
vi
ls
rm installer.sh 
vi
cd dotfiles/nvim/.config/nvim/
vi init.vim 
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
ls
sh ./installer.sh ~/.cache/dein
vi init.vim 
git clone https://github.com/k-takata/minpac.git     ~/.config/nvim/pack/minpac/opt/minpac
ls
rm installer.sh 
vi init.vim 
sudo apt install fzf
vi init.vim 
sudo apt install xfce4-terminal
xfce4-terminal
vi init.vim 
cd ~/UTT/NF04/Projet/
vi .
cd .local/share/dwm
ls
cd patches/
vi dwm-uselessgap-6.2.diff
cd ../
patch -p1 < patches/dwm-uselessgap-6.2.diff 
vi config.h
sudo make clean install
ip a
cd .local/share/
ls
git clone https://git.suckless.org/slstatus
cd slstatus/
ls
cp config.def.h 
cp config.def.h config.h
vi config.h
sudo make clean install
slstatus
vi config.h
cd /sys/class/power_supply/
ls
cd -
vi config.h 
sudo make clean install
vi config.h 
cd /etc/modules-load.d/
vi modules.conf
sudo vi modules.conf
cd -
ls
vi config.h
sudo make clean install
slstatus
sudo reboot
startx
neomutt
man date
slstatus
ls
sudo vi modules.conf 
cd -
cd .local/share/slstatus/
vi config.h
sudo make clean isntall
sudo make clean install
slstatus
vi config.h
sudo make clean install 
slstatus
vi config.h
sudo make clean install
slstatus
sudo make clean install
slstatus
vi config.h
sudo make clean install
slstatus
sudo apt install ttf-hack
apt search hack
apt search hack | less
sudo apt install fonts-hack
sudo apt install fontawesome
sudo apt search fontawesome
sudo apt search font awesome
sudo apt install fonts-font-awesome
vi config.h
sudo make clean install
slstatus
vi config.h
sudo make clean install
cd ~
vi .xinitrc 
cd -../dwm
cd -
cd ../dwm
vi config.h
sudo make clean install
xlsfonts
xlsfonts | grep awesome
xlsfonts | grep hack
xlsfonts | grep deja
xlsfonts | grep Deja
mkfontscale
mkfontdir
xlsfonts
xlsfonts | grep t
xlsfonts | grep hack
xlsfonts | grep awesome
xlsfonts | grep gliph
fc-list 
cd .local/share/slstatus/
vi config.h
sudo make clean install
sudo apt install xbacklight
cd .local/share/
ls
cd mail/
l
ls
cd cock-li/
ls
cd INBOX/
ls
cd cur/
ls
cd ../
ls
cd new/
ls
ls -a
cd ../../
cd ../
cd disroot/INBOX/new/
ls
cd ../../../
cd utt/INBOX/new/
ls
cd cd ~/.local/share/slstatus/
cd ~/.local/share/slstatus/
vi config.h
mailsync
sudo apt install dunst
apt info dunst
notify-send "yu"
sudo apt install libnotify
mailsync
apt search libnotify
sudo apt install libnotify4
sudo apt install libnotify-bin
notify-send tru
mailsync
cd .local/share/dwm
vi config.h
pamixer
amixer sset Master Toggle
amixer
alsamixer
sudo reboot
nnn
sudo apt install nnn
cd .local/share/
nnn
ls
cd Discord/
ls
rm -rf Discord/
ls
cd ../
rm -rf Discord/
mkdir Discord
cd Discord/
ls
mv Discord/ ../Discord2/
cd ../
ls
cd Discord
ls
cd ../
rm -rf Discord
mv Discord2/ Discord/
cd Discord/
ls
ln -s ~/.local/share/bin/Discord
ln -s ~/.local/share/bin/Discord Discord
cd ~/.local/share/bin
ls
cd cd ..
ls
cd ../
ls
mkdir bin
cd -
cd Discord/
ln -s ~/.local/bin/discord Discord
ln -s ~/.local/bin/discord ~/.local/share/Discord/Discord 
man ln
sudo apt install pcmanfm
pcmanfm
cd ../../bin/
ls
rm discord.desktop 
cd ../share/Discord/
ls
ln -s Discord ~/.local/bin/discord
cd ~/.local/bin/discord 
cd ~/.local/bin/
ls -lh
cd ../
source .profile
cat .profile 
discord
PATH="$HOME/.local/bin:$PATH"
discord
Discord
cd .local/bin/
./discord
ls
discord
ls -lh
discord
rmlink discord
rm discord 
cd ../share/Discord/
ln -s Discord ~/.local/bin/discord
cd -
ls
./di
cd -
./Discord 
chmod 4755 chrome-sandbox
./Discord 
chown root:root chrome-sandbox 
sudo chown root:root chrome-sandbox 
ls -lh
./Discord 
sudo chown axel:axel chrome-sandbox 
sudo chown root:root chrome-sandbox 
sudo chmod 4755 chrome-sandbox 
./Discord 
cd -
alsamixer
cd .config/
mkdir alsa
sudo updatedb
locate asound
alsamixer
sudo apt autopurge alsamixer
sudo apt autopurge alsa-utils
sudo apt install alsa-utils
ls
cd alsa
s
ls
ls -a
alsamixer
snd_config_update_r
cd
cat /etc/asound.conf
cat /usr/share/alsa/alsa.conf 
cd .config/alsa/
vi .asoundrc
alsamixer
sudo apt install xarchiver
nnn
alsamixer
cd .config/alsa/
mv .asoundrc asoundrc
sudo reboot
startx
alsamixer
amixer sset Master Toggle
alsamixer
cd .local/share/Discord
./Discord 
cd /etc/
vi asound.conf
cd alternatives/
cd ../
cd alsa
alsamixer
cd /usr/share/alsa/
ls
vi alsa.conf 
sudo apt autopurge alsa-base
sudo apt autopurge alsa-utils
sudo apt autopurge alsa-oss
sudo apt autopurge libasound2
sudo reboot
sudo apt install alsa-base alsa-utils
sudo apt install alsa-utils
aplay -l
systemctl reboot
startx
cd .local/share/dwm
sudo make clean install
alsamixer
cd .local/share/dwm
vi config.h
xbacklight
sudo find /sys/ -type f -iname '*brightness*'
sudo ln -s /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-LVDS-1/intel_backlight  /sys/class/backlight
sudo vi /etc/X11/xorg.conf
xbacklight -inc 5
systemctl logout
cd /etc/X11/
ls
vi xorg.conf 
systemctl reboot
startx
sudo vi /etc/X11/xorg.conf 
apt list --install | grep intel
apt list --installed | grep intel
sudo vi /etc/X11/xorg.conf 
cat /sys/class/backlight/
cd /sys/class/
ls
cd backlight/
ls
cat intel_backlight
cd intel_backlight
ls
cat brightness 
sudo vi brightness 
cd /etc/X11/
ls
sudo rm xorg.conf 
sudo mkdir xorg.conf.d
cd xorg.conf.d/
ls
sudo vi 20-intel.conf
startx
sudo reboot
sudo apt install xserver-xorg-video-intel
systemctl reboot
xbacklight -inc 5
xbacklight -inc 50
cd .local/share/dwm
ls
vi config.h
sudo make clean install
man amixer
sudo apt install alsa-firmware
amixer sset Mic Mute
amixer
amixer -q sset Master 3%+
amixer
amixer -q sset Master 3%+
man amixer
alsamixer
amixer sset Master +5
cd .local/share/dwm
vi config.h
amixer sset Master +5dB
amixer -c 1 set Master 2dB+
amixer -c 0 set Master 2dB+
cd .local/share/dwm
ls
vi config.h
ls -a
vi config.h
sudo make clean install
alsamixer
cd .local/share/dwm
vi config.h
sudo make clean install
vi config.h
sudo make clean install
vi config.h
sudo make clean install
cd dotfiles/
git status
ls
vi .gitmodules 
rm .gitmodules 
ls
ls -a
git submodules status
git submodule status
git rm -cached zsh/.local/share/zsh/plugins/fast-syntax-highlighting
git rm --cached zsh/.local/share/zsh/plugins/fast-syntax-highlighting
git rm --cached dein/.cache/dein/repos/github.com/Shougo/dein.vim/
cd .git/config 
vi .git/config 
git status
git add dwm/
git status
git add keepassxc/
git add nvim/
git rm --cached nvim/.config/nvim/pack/minpac/opt/minpac/
git rm --cached nvim/
git rm -r --cached nvim/
git status
git status | less
git reset keepassxc/.config/chromium/
git status
ls
cd keepassxc/
ls
ls -a
cd .config/
ls
cd ~/.config/keepassxc
ls
ls -a
git reset keepassxc/.config/
git status
cd ../
ls
cd ../
rm -rf dotfiles/
cd .config/nvim
cd ./
cd ../
cd axel/
git clone git@github.com:axelcalixte/dotfiles.git
cd dotfiles/
ls
git status
git submodule status
vi .gitmodules 
rm .gitmodules 
vi .git/config 
git submodule status
git status
git commit -m "removed submodules"
git add -u
git status
git commit -m "removed submodules"
git push
git status
cd .git/
ls
cd modules
cd ../
ls
rm -rf dein
cd dwm/
ls
cd .local/share/dwm/
ls
vi config.h
ls
cd patches/
ls
vi useless-gaps-62.diff
cd ../
patch -p1 < patches/useless-gaps-62.diff 
vi config.h
cd ../
ls
cd st/
ls
ls -a
cd .local/share/
ls
cd st/
ls
cd patches/
ls
cd ../
sudo vi config.h
st --version
help
cd patches/
vi st-scrollback-20200419-72e3f6c.diff
cd ../
patch -p1 < patches/st-scrollback-20200419-72e3f6c.diff 
cd patches/
vi st-rightclickpaste-0.8.2.diff
cd ../
patch -p1 < patches/st-rightclickpaste-0.8.2.diff 
vi x.c
mmande pour continuer
ls
rm x.c.rej
cd patches/
ls
rm st-rightclickpaste-0.8.2.diff 
cd ../
vi config.h
cd patches/
ls
cd ../
vi config.h
cd patches/
ls
vi st-scrollback-20200419-72e3f6c.diff 
cd ../
patch -p1 > patches/st-scrollback-20200419-72e3f6c.diff 
cd patches/
vi st-scrollback-20200419-72e3f6c.diff 
ls -a
cat st-scrollback-20200419-72e3f6c.diff 
vi st-scrollback-20200419-72e3f6c.diff 
cd ../
patch -p1 < patches/st-scrollback-20200419-72e3f6c.diff 
sudo make clean install
sudo apt install fzf
sudo updatedb
locate fzf
apt list --installed | grep zsh
sudo apt install zsh-autosuggestions
apt search zsh
locate completion.zsh
zsh
cd dotfiles/zsh/.local/share/zsh/
ls
cd ../
cd ~/dotfiles/
git submodule
less
ezf
qzef
qze
f
qze
fq
zef
qze
f
qzef
zqe
f
qzef
q
zef
qz
ef
zq
ef
zq
ef
qze
f
qze
fq
zef
qz
ef
qzef
zqef
cd dotfiles/st/.local/share/st/
ls
rm *.rej
cd ../
cd ~/dotfiles/
ls
git status
git rm dein/.cache/dein/repos/github.com/Shougo/dein.vim
git commit -m "configured st and dwm"
git status
git add -u
git status
git commit -m "configured st and dwm"
git push
cd nvim/.config/nvim/
vi init.vim 
git clone https://github.com/k-takata/minpac.git     ~/.config/nvim/pack/minpac/opt/minpac
git clone https://github.com/k-takata/minpac.git     ~/dotfiles/nvim/.config/nvim/pack/minpac/opt/minpac
ls
cd pack/
ls
cd minpac/
ls
cd opt/
ls
cd minpac/
ls
cd ~/.config/
ls
cd nvim
ls
rm -rf pack/
cat init.vim 
:q
vi init.vim 
rm -rf init.vim coc-settings.json 
cd ../
cd dotfiles/nvim/.config/
ls
cd nvim/
ls
ls -a
trash
cd /tmp/
ls
sudo apt install trash-cli
cd -
ls
vi init.vim
cd dotfiles
cd ../../../
ls
git submodule add 
git submodule add git@github.com:k-takata/minpac.git nvim/.config/nvim/pack/minpac/opt/minpac
cd ../.config/nvim
ls
ls -lh
cd ~/dotfiles/nvim/.config/
ls
cd nvim/
ls
cd ../../../
stow nvim
cd ../.config/nvim
ls
ls -lh
mv * truc/
mkdir truc/
mv * truc/
ls
cd truc/
ls
cd ../
cd ~/dotfiles/
cd nvim/.config/nvim/
ls
cd truc/
mv * ../
cd ../
ms
ls
rm -r truc/
cd ../../../
git status
git add -u
git status
cat .gitmodules 
git commit -m "new vim config"
rm -rf dein
ls -a
git commit -m "delete dein"
git status
git push
cd zsh/.local/share/zsh/
ls
rm -rf plugins/ pure
cd ../../../
cd ../
git status
git add -u
ls
ls -a
git status
git commit -m "removed zsh stuff"
cd zsh/.local/share/
vi .zshrc
ls -a
cd zsh/
ls
cd ../../
ls
cd ../.config/
ls
cd zsh/
ls
ls -a
vi .zshrc 
cd ../
git submodule add git@github.com:zdharma/fast-syntax-highlighting.git zsh/.local/share/zsh/plugins/fast-syntax-highlighting
git submodule status
git submodule
zsh
cd zsh
mkdir -p .cache/zsh
cd .local/share/zsh/
ls
ls -a
cd ../../
ls
cd ../.cache/
ls
cd zsh/
ls
touch history
cd ../../
cat .config/zsh/.zshrc 
vi .config/zsh/.zshrc 
cd ../
git submodule add git@github.com:sindresorhus/pure.git zsh/.local/share/pure
cat .gitmodules 
zsh
cd ../.config/zsh/
ls
ls -a
cd ../../
cd .cache/zsh/
cd dotfiles/
stow zsh
zsh
cd ../.cache/zsh/
ls
cat history 
cd ../../
cd .local/share/zsh/
ls
zsh
cd ~/dotfiles/zsh/.local/zsh
cd ~/dotfiles/zsh/.local/share/
ls
stow pure
zsh
cd pure/
ls
zsh
chsh
zsh
chsh -s /usr/bin/zsh
locate /usb/bin/zsh
locate /bin/zsh
sudo chsh -s /usr/bin/zsh
vi .profile 
echo $EDITOR
systemctl reboot
startx
