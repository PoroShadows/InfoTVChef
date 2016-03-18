# execute 'sudo apt-get update' do
# end

apt_package 'omxplayer' do
  action :install
end

execute "sudo curl https://yt-dl.org/downloads/2016.04.13/youtube-dl -o /usr/local/bin/youtube-dl" do
end

execute "sudo chmod a+rx /usr/local/bin/youtube-dl" do
end

apt_package 'python3.4' do
  action :install
end

apt_package 'python-imaging' do
  action :install
end

apt_package 'python-imaging-tk' do
  action :install
end

apt_package 'unclutter' do
  action :install
end

apt_package 'mplayer' do
  action :install
end

apt_package 'uzbl' do
  action :install
end

execute 'sh /home/pi/InfoTVChef/clone-git-repo.sh' do
end

execute 'sudo sh /home/pi/InfoTVChef/add-lines.sh "python /home/pi/pipresents/pipresents.py -f -b -p fria_infotv_1p3" /home/pi/.config/lxsession/LXDE-pi/autostart' do
end