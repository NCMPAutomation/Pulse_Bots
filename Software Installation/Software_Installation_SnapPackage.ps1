#Install application using snap packages
sudo yum install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo reboot
sudo snap install hello-world
hello-world