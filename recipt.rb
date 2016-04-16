# Ruby
def directory_exists?(directory)
  File.directory?(directory)
end

# Chef
# Update apt
# apt_update
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

apt_package 'wget'

execute 'wget https://github.com/KenT2/pipresents-gapless/tarball/master -O - | tar xz'

if directory_exists('/home/pi/FriaInfoTV')
  git 'FriaInfoTV-repo' do
    repository 'https://github.com/dahnielson/FriaInfoTV'
    destination '/home/pi/FriaInfoTV'
    action :sync
  end
else
  git 'FriaInfoTV-repo' do
    repository 'https://github.com/dahnielson/FriaInfoTV'
    destination '/home/pi/FriaInfoTV'
    action :checkout
  end
end

bash 'add-lines' do
  code <<-EOH
    if grep -q "python /home/pi/pipresents/pipresents.py -f -b -p fria_infotv_1p3" /home/pi/.config/lxsession/LXDE-pi/autostart; then
      echo "file has the args"
    else
      echo "python /home/pi/pipresents/pipresents.py -f -b -p fria_infotv_1p3" >> /home/pi/.config/lxsession/LXDE-pi/autostart
    fi
    EOH
end
