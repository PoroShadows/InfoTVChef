# Update apt
execute 'sudo apt-get update'

# Instal packages
apt_package 'omxplayer'

apt_package 'python3.4'

apt_package 'python-imaging'

apt_package 'python-imaging-tk'

apt_package 'unclutter'

apt_package 'mplayer'

apt_package 'uzbl'

# Execute scripts
execute "sudo curl https://yt-dl.org/downloads/2016.04.13/youtube-dl -o /usr/local/bin/youtube-dl"

execute "sudo chmod a+rx /usr/local/bin/youtube-dl"

execute 'sh /home/pi/InfoTVChef/clone-git-repo.sh'

execute 'sudo sh /home/pi/InfoTVChef/add-lines.sh "python /home/pi/pipresents/pipresents.py -f -b -p fria_infotv_1p3" /home/pi/.config/lxsession/LXDE-pi/autostart'

# Experimantal. Not tested.
cron 'network-login' do
  minute '0'
  command 'python /home/pi/FriaInfoTV/infotv-network.py Guest fria123'
end
